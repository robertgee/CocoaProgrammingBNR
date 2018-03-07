//
//  ScheduleFetcher.h
//  RanchForecast
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleFetcher : NSObject <NSXMLParserDelegate> {
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
}

// Returns an NSArray of ScheduledClass objects if successful
// Returns nil on failure
- (NSArray *)fetchClassesWithError:(NSError **)outError;

@end
