//
//  NSString+FirstLetter.m
//  TypingTutor
//
//  Created by Robert Gee on 3/4/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

- (NSString *)bnr_firstLetter
{
    if ([self length] < 2) {
        return self;
    }
    
    NSRange r;
    r.location = 0;
    r.length = 1;
    return [self substringWithRange:r];
}

@end
