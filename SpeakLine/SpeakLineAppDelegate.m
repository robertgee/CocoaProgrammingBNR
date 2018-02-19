//
//  AppDelegate.m
//  SpeakLine
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#import "SpeakLineAppDelegate.h"

@interface SpeakLineAppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation SpeakLineAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (id) init {
    self = [super init];
    if (self) {
        // Logs can help the beginner understand what
        // is happening and hunt down bugs.
        NSLog(@"init");
        
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    return self;
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    
    // Is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

@end
