//
//  AppDelegate.h
//  SpeakLine
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeakLineAppDelegate : NSObject <NSApplicationDelegate> {
    NSSpeechSynthesizer *_speechSynth;
}

@property (nonatomic, weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *stopIt;
@property (weak) IBOutlet NSButton *sayIt;

@end

