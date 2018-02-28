//
//  AppController.h
//  RaiseMan
//
//  Created by Robert Gee on 2/28/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PreferenceController;

@interface AppController : NSObject {
    PreferenceController *preferenceController;
}

- (IBAction)showPreferencePanel:(id)sender;

@end
