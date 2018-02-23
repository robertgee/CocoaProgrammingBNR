//
//  KvcFunAppDelegate.h
//
//  Created by Robert Gee on 2/21/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KvcFunAppDelegate : NSObject <NSApplicationDelegate> {
    int fido;
}
@property (weak) IBOutlet NSView *window;
@property (readwrite, assign) int fido;

- (IBAction)incrementFido:(id)sender;
@end
