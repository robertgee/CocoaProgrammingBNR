//
//  KvcFunAppDelegate.m
//
//  Created by Robert Gee on 2/21/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "KvcFunAppDelegate.h"

@interface KvcFunAppDelegate ()

@end

@implementation KvcFunAppDelegate

@synthesize fido = _fido;

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
        [self setValue:[NSNumber numberWithInt:5]
                forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido = %@", n);
    }
    
    return self;
}

- (IBAction)incrementFido:(id)sender {
    [self willChangeValueForKey:@"fido"];
    _fido++;
    NSLog(@"fido is now %d", _fido);
    [self didChangeValueForKey:@"fido"];
}

@end
