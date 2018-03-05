//
//  BigLetterView.m
//  TypingTutor
//
//  Created by Robert Gee on 3/4/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (void)prepareAttributes
{
    attributes = [NSMutableDictionary dictionary];
    
    [attributes setObject:[NSFont userFontOfSize:75]
                    forKey:NSFontAttributeName];
    
    [attributes setObject:[NSColor redColor]
                    forKey:NSForegroundColorAttributeName];
}

- (BOOL)acceptsFirstResponder
{
    NSLog(@"Accepting");
    return YES;
}

- (BOOL)resignFirstResponder
{
    NSLog(@"Resigning");
    [self setNeedsDisplay:YES];
    return YES;
}

- (BOOL)becomeFirstResponder
{
    NSLog(@"Becoming");
    [self setNeedsDisplay:YES];
    return YES;
}

- (void)awakeFromNib {
    NSLog(@"initializing view");
    [self prepareAttributes];
    bgColor = [NSColor yellowColor];
    string = @" ";
}

- (void)keyDown:(NSEvent *)event
{
    [self interpretKeyEvents:[NSArray arrayWithObject:event]];
}

- (void)insertText:(NSString *)input
{
    // Set string to be what the user typed
    [self setString:input];
}

- (void)insertTab:(id)sender
{
    [[self window] selectKeyViewFollowingView:self];
}

// Be careful with the capitalization here, "backtab" is considered
// one word
- (void)insertBacktab:(id)sender
{
    [[self window] selectKeyViewPrecedingView:self];
}

- (void)deleteBackward:(id)sender
{
    [self setString:@" "];
}

- (void)drawRect:(NSRect)rect {
    //[super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bounds];
    
    [self drawStringCenteredIn:bounds];
    
    // Am I the window's first responder?
    if ([[self window] firstResponder] == self) {
        [[NSColor keyboardFocusIndicatorColor] set];
        [NSBezierPath setDefaultLineWidth:4.0];
        [NSBezierPath strokeRect: bounds];
    }
    
}

- (void)drawStringCenteredIn:(NSRect)r
{
    NSSize strSize = [string sizeWithAttributes:attributes];
    NSPoint strOrigin;
    strOrigin.x = r.origin.x + (r.size.width - strSize.width) / 2;
    strOrigin.y = r.origin.y + (r.size.height - strSize.height) / 2;
    [string drawAtPoint:strOrigin withAttributes:attributes];
}

- (IBAction)savePDF:(id)sender
{
    __block NSSavePanel *panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"pdf"]];
    
    [panel beginSheetModalForWindow:[self window]
                  completionHandler:^ (NSInteger result)
                {
                      if (result == NSModalResponseOK)
                      {
                          NSRect r = [self bounds];
                          NSData *data = [self dataWithPDFInsideRect:r];
                          NSError *error;
                          BOOL successful = [data writeToURL:[panel URL]
                                                     options:0
                                                       error:&error];
                          
                          if (!successful) {
                              NSAlert *a = [NSAlert alertWithError:error];
                              [a runModal];
                          }
                      }
                      panel = nil;  // avoid strong ref cycle
                }];
}


- (BOOL) isOpaque
{
    return YES;
}

#pragma mark Accessors

- (void)setBgColor:(NSColor *)c
{
    bgColor = c;
    [self setNeedsDisplay:YES];
}

- (NSColor *)bgColor
{
    return bgColor;
}

- (void)setString:(NSString *)c
{
    string = c;
    NSLog(@"The string: %@", string);
    [self setNeedsDisplay:YES];
}

- (NSString *)string
{
    return string;
}

- (void)writeToPasteBoard:(NSPasteboard *)pb
{
    // Copy data to the pasteboard
    [pb clearContents];
    [pb writeObjects:[NSArray arrayWithObject:string]];
}

- (BOOL)readFromPasteboard:(NSPasteboard *)pb
{
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    NSArray *objects = [pb readObjectsForClasses:classes
                                         options:nil];
    
    if ([objects count] > 0) {
        // Read the string from the pasteboard
        NSString *value = [objects objectAtIndex:0];
        
        // Our view can handle only one letter
        if ([value length] == 1) {
            [self setString:value];
            return YES;
        }
    }
    return NO;
}

- (IBAction)cut:(id)sender
{
    [self copy:sender];
    [self setString:@""];
}

- (IBAction)copy:(id)sender
{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [self writeToPasteBoard:pb];
}

- (IBAction)paste:(id)sender
{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    if (![self readFromPasteboard:pb]) {
        NSBeep();
    }
}

@end
