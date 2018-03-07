//
//  AppDelegate.m
//  RanchForecast
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "AppDelegate.h"
#import "ScheduleFetcher.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc] init];
    NSError *error = nil;
    [fetcher fetchClassesWithError:&error];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
