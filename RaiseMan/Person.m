//
//  Person.m
//  RaiseMan
//
//  Created by Robert Gee on 2/22/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personName;
@synthesize expectedRaise;

- (id) init
{
    self = [super init];
    if (self) {
        expectedRaise = 0.05;
        personName = @"New Person";
    }
    return self;
}

@end
