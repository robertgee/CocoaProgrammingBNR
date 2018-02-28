//
//  AppController.m
//  RaiseMan
//
//  Created by Robert Gee on 2/28/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"

@implementation AppController

- (IBAction)showPreferencePanel:(id)sender
{
    // Is preferenceController nil?
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc] init];
    }
    
    NSLog(@"showing %@", preferenceController);
    [preferenceController showWindow:self];
}

@end
