//
//  Document.h
//  Departments
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ManagingViewController;

@interface Document : NSPersistentDocument {
    IBOutlet NSBox *box;
    IBOutlet NSPopUpButton *popUp;
    NSMutableArray *viewControllers;
}

- (IBAction)changeViewController:(id)sender;

- (void)displayViewController:(ManagingViewController *)vc;

@end
