//
//  RandomController.h
//  Random
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#ifndef RandomController_h
#define RandomController_h

#import <Cocoa/Cocoa.h> 
#import <Foundation/Foundation.h>

@interface RandomController : NSObject {
    IBOutlet NSTextField *textField;
}

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;

@end

#endif /* RandomController_h */
