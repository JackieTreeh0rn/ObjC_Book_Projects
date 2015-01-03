//
//  Document.h
//  GUI_MacOS-Cocoa_TahDoodle
//
//  Created by EvilKernel on 1/2/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable; // IBOutlet tells xcode the tasktable pointer will be assigned in interface builder and not in the class's code files


- (IBAction)addTask:(id)sender;  // IBAction tells XCode that addTask: is an action method and that the associated target action pair will be configured in the interface builder and not the class's class files

@end

