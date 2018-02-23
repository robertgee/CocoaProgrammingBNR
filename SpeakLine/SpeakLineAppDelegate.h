//
//  AppDelegate.h
//  SpeakLine
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeakLineAppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate> {
    NSArray *_voices;
    NSSpeechSynthesizer *_speechSynth;
}

@property (nonatomic, weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSButton *speakButton;
@property (weak) IBOutlet NSTableView *tableView;

@end

