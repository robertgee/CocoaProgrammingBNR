//
//  StretchView.h
//  DrawingFun
//
//  Created by Robert Gee on 3/3/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView {
    NSBezierPath *path;
    NSImage *image;
    float opacity;
    NSPoint downPoint;
    NSPoint currentPoint;
}

@property (assign) float opacity;
@property (strong) NSImage *image;

- (NSPoint)randomPoint;
- (NSRect)currentRect;

@end
