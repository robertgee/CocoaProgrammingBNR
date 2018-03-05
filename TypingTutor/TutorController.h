//
//  TutorController.h
//  TypingTutor
//
//  Created by Robert Gee on 3/5/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BigLetterView;

@interface TutorController : NSObject {
    // Outlets
    IBOutlet BigLetterView *inLetterView;
    IBOutlet BigLetterView *outLetterView;
    IBOutlet NSWindow *speedSheet;
    
    // Data
    NSArray *letters;
    int lastIndex;
    
    // Time
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    NSTimeInterval timeLimit;
    NSTimer *timer;
}

- (IBAction)stopGo:(id)sender;
- (IBAction)showSpeedSheet:(id)sender;
- (IBAction)endSpeedSheet:(id)sender;


- (void)updateElapsedTime;
- (void)resetElapsedTIme;
- (void)showAnotherLetter;

@end
