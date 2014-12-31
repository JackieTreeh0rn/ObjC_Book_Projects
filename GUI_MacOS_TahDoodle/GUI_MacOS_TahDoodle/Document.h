//
//  Document.h
//  GUI_MacOS_TahDoodle
//
//  Created by EvilKernel on 12/31/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// This is the controller class for a document type app.
// for each to-do window/list the user has opened there will be an instance of this Document class
// that will act as a controller for that window.

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable; // IBOutlet tells xcode the tasktable pointer will be assigned in interface builder and not in the class's code files

- (IBAction)addtask:(id)sender; // IBAction tells XCode that addTask: is an action method and that the associated target action pair will be configured in the interface builder and not the class's class files


@end

