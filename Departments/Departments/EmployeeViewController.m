//
//  EmployeeViewController.m
//  Departments
//
//  Created by Robert Gee on 3/7/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (id)init
{
    self = [super initWithNibName:@"EmployeeViewController" bundle:nil];
    
    if (self) {
        [self setTitle:@"Employees"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
