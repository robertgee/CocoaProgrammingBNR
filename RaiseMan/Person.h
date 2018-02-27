//
//  Person.h
//  RaiseMan
//
//  Created by Robert Gee on 2/22/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#ifndef Person_h
#define Person_h

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding> {
    NSString *personName;
    float expectedRaise;
}

@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;

@end

#endif /* Person_h */
