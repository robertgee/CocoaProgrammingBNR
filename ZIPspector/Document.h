//
//  Document.h
//  ZIPspector
//
//  Created by Robert Gee on 3/24/18.
//  Copyright © 2018 Robert Gee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
{
    IBOutlet NSTableView *tableView;
    NSArray *filenames;
}
@end

