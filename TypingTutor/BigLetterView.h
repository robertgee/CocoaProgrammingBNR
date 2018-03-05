//
//  BigLetterView.h
//  TypingTutor
//
//  Created by Robert Gee on 3/4/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView {
    NSColor *bgColor;
    NSString *string;
    NSMutableDictionary *attributes;
}

@property (strong) NSColor *bgColor;
@property (copy)NSString *string;

- (void)prepareAttributes;

- (IBAction)savePDF:(id)sender;

@end
