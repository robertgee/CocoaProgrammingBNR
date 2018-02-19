//
//  RandomController.m
//  Random
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomController.h"

@implementation RandomController

- (id) init {
    self = [super init];
    
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)generate:(id)sender {
    // Generate a number between 1 and 100 inclusive
    int generated;
    generated = (int)(random() % 100) + 1;
    
    NSLog(@"generated = %d", generated);
    
    // Ask the text field to change what it is displaying
    [textField setIntValue:generated];
}

- (IBAction)seed:(id)sender {
    // Seed the random number generator with the time
    srandom((unsigned)time(NULL));
    [textField setStringValue:@"Generator seeded"];
}


- (void)awakeFromNib {
    NSDate *now;
    now = [NSDate date];
    [textField setObjectValue:now];
}
@end
