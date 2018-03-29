//
//  AppDelegate.h
//  iPing
//
//  Created by Robert Gee on 3/28/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSTextView *outputView;
    IBOutlet NSTextField *hostField;
    IBOutlet NSButton *startButton;
    NSTask *task;
    NSPipe *pipe;
}

@property (assign) IBOutlet NSWindow *window;
- (IBAction)startStopPing:(id)sender;
@end

