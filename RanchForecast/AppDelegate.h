//
//  AppDelegate.h
//  RanchForecast
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSTableView *tableView;
    NSArray *classes;
}

@property (strong) IBOutlet NSWindow *window;

@end

