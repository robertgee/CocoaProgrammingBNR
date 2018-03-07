//
//  ManagingViewController.h
//  Departments
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ManagingViewController : NSViewController {
    NSManagedObjectContext *managedObjectContext;
}

@property (strong) NSManagedObjectContext *managedObjectContext;

@end
