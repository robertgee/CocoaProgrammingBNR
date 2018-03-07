//
//  DepartmentViewController.m
//  Departments
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "DepartmentViewController.h"

@interface DepartmentViewController ()

@end

@implementation DepartmentViewController

- (id)init
{
    self = [super initWithNibName:@"DepartmentViewController" bundle:nil];
    
    if (self) {
        [self setTitle:@"Departmens"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
