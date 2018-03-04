//
//  StretchView.m
//  DrawingFun
//
//  Created by Robert Gee on 3/3/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "StretchView.h"


@implementation StretchView

- (void)awakeFromNib
{
    // Seed the random number generator
    srandom((unsigned)time(NULL));
    
    // Create a path object
    path = [NSBezierPath bezierPath];
    [path setLineWidth:3.0];
    
    NSPoint p = [self randomPoint];
    [path moveToPoint:p];
    
    for (int i = 0; i < 15; i++) {
        p = [self randomPoint];
        [path lineToPoint:p];
    }

    [path closePath];
}

// randomPoint returns a random point inside the view
- (NSPoint)randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}

- (void)drawRect:(NSRect)rect
{
    NSRect bounds = [self bounds];
    
    // Fill the view with green
    [[NSColor greenColor] set];
    [NSBezierPath fillRect: bounds];
    
    // Draw the path in white
    [[NSColor whiteColor] set];
    [path stroke];
}
@end
