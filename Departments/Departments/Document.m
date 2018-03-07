//
//  Document.m
//  Departments
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "Document.h"
#import "DepartmentViewController.h"
#import "EmployeeViewController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        viewControllers = [[NSMutableArray alloc] init];
        
        ManagingViewController *vc;
        vc = [[DepartmentViewController alloc] init];
        [vc setManagedObjectContext:[self managedObjectContext]];
        [viewControllers addObject:vc];
        
        vc = [[EmployeeViewController alloc] init];
        [vc setManagedObjectContext:[self managedObjectContext]];
        [viewControllers addObject:vc];
    }
    return self;
}

- (void)displayViewController:(ManagingViewController *)vc
{
    // Try to end editing
    NSWindow *w = [box window];
    BOOL ended = [w makeFirstResponder:w];
    if (!ended) {
        NSBeep();
        return;
    }
    
    // Put the view in the box
    NSView *v = [vc view];
    [box setContentView:v];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)windowsController
{
    [super windowControllerDidLoadNib:windowsController];
    NSMenu *menu = [popUp menu];
    
    NSUInteger i, itemCount;
    itemCount = [viewControllers count];
    
    for (i = 0; i < itemCount; i++) {
        NSViewController *vc = [viewControllers objectAtIndex:i];
        NSMenuItem *mi = [[NSMenuItem alloc] initWithTitle:[vc title]
                                                    action:@selector(changeViewController:)
                                             keyEquivalent:@""];
        
        [mi setTag: i];
        [menu addItem:mi];
    }
    
    // Initially show the first controller
    [self displayViewController:[viewControllers objectAtIndex:0]];
    [popUp selectItemAtIndex:0];
}

- (IBAction)changeViewController:(id)sender
{
    NSUInteger i = [sender tag];
    ManagingViewController *vc = [viewControllers objectAtIndex:i];
    [self displayViewController:vc];
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


@end
