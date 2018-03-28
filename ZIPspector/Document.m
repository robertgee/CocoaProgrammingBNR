//
//  Document.m
//  ZIPspector
//
//  Created by Robert Gee on 3/24/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromURL:(NSURL *)absoluteURL
             ofType:(NSString *)typeName
              error:(NSError **)outError
{
    // Which file are we getting the zipinfo for?
    NSString *filename = [absoluteURL path];
    
    // Prepare a task object
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/zipinfo"];
    NSArray *args = [NSArray arrayWithObjects:@"-1", filename, nil];
    [task setArguments:args];
    
    // Create the pipe to read from
    NSPipe *outPipe = [[NSPipe alloc] init];
    [task setStandardOutput:outPipe];
    
    // Start the process
    [task launch];
    
    // Read the output
    NSData *data = [[outPipe fileHandleForReading] readDataToEndOfFile];
    
    // Make sure the task terminates normally
    [task waitUntilExit];
    int status = [task terminationStatus];
    
    // Check status
    if (status != 0) {
        if (outError) {
            NSDictionary *eDict =
            [NSDictionary dictionaryWithObject:@"zipinfo failed"
                                        forKey:NSLocalizedFailureReasonErrorKey];
            
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain
                                            code:0
                                        userInfo:eDict];
        }
        return NO;
    }
    
    // Convert to a string
    NSString *aString = [[NSString alloc] initWithData: data
                                               encoding:NSUTF8StringEncoding];
    
    // Break the string into lines
    filenames = [aString componentsSeparatedByString:@"\n"];
    NSLog(@"filenames = %@", filenames);
    
    // In case of revert
    [tableView reloadData];
    
    return YES;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)v
{
    return [filenames count];
}

- (id)tableView:(NSTableView *)tv
    objectValueForTableColumn:(NSTableColumn *)tc
            row:(NSInteger)row
{
    return [filenames objectAtIndex:row];
}

@end
