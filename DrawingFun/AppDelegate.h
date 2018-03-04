//
//  AppDelegate.h
//  DrawingFun
//
//  Created by Robert Gee on 3/3/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@class StretchView;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet StretchView *stretchView;
}

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (IBAction)showOpenPanel:(id)sender;

@end

