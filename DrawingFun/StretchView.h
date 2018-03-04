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
}

- (NSPoint)randomPoint;

@end
