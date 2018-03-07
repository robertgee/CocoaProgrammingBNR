//
//  ScheduledClass.h
//  RanchForecast
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduledClass : NSObject {
    NSString *name;
    NSString *location;
    NSString *href;
    NSDate *begin;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *href;
@property (nonatomic, strong) NSDate *begin;

@end
