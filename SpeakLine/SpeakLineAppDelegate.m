//
//  AppDelegate.m
//  SpeakLine
//
//  Created by Robert Gee on 2/19/18.
//  Copyright © 2018 com.bignerdranch. All rights reserved.
//

#import "SpeakLineAppDelegate.h"

@interface SpeakLineAppDelegate ()

@end

@implementation SpeakLineAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (id) init
{
    self = [super init];
    if (self) {
        // Logs can help the beginner understand what
        // is happening and hunt down bugs.
        NSLog(@"init");
        
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        
        [_speechSynth setDelegate:self];
        
        _voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (IBAction)sayIt:(id)sender
{
    NSString *string = [_textField stringValue];
    
    // Is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
    
    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
    [_tableView setEnabled:NO];
}

- (IBAction)stopIt:(id)sender
{
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
    
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
    [_tableView setEnabled:YES];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView *)tv
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [_tableView selectedRow];
    if (row == 1) {
        return;
    }
    
    NSString *selectedVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@", selectedVoice);

}

- (void)awakeFromNib
{
    // When the table view appears on screen, the default voice
    // should be selected
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [_voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}

@end
