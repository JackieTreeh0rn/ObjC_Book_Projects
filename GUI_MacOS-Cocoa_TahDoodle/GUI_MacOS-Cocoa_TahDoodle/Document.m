//
//  Document.m
//  GUI_MacOS-Cocoa_TahDoodle
//
//  Created by EvilKernel on 1/2/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

# pragma mark - NSDocument Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
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
    
    /*** This method is called when our document is being saved. You are expected
     to hand to the caller an NSData object wrapping our data so that it can be written to disk ***/
    // If there is no array, write out an empty array
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    // Pack the tasks array into an NSData Object (if errors, just handin back the NSError generated (not defining as shown in previous chapter)
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];
    
    // Return the newly-packed NSData object
    return data;
   
  // Boiler plate code - creates an exception in case this method isnt ovwritten here and there is no way to save the document //
    /* [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil; */
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    
    /*** This method is called when a document is being loaded.
     You are handed an NSData object and expected to pull our data out of it ***/
    
    // Extract the tasks (if errors, just handin back the NSError generated (not defining as shown in previous chapter)
    self.tasks = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListMutableContainers format:NULL error:outError];
    
    // Return success or failure dependiong on success of the above call
    return (self.tasks !=nil);
    
    
    // Boiler plate code - creates an exception in case this method isnt ovwritten here and there is no way to save the document //
    /* [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES; */
    
}

# pragma mark - Actions

- (void)addTask:(id)sender {
    
    // If there is no array yet, create one
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    [self.tasks addObject:@"New Item"];
    
    // -reloadData tells the table view to reresh and ask its
    // dataSource, (which happens to be this document object in this case)
    // for new data to display
    [self.taskTable reloadData];
    
    // - updateChangeCount: tells the application whether or not the document
    // has unsaved changes, NSChangeDone flags the document as unsaved
    [self updateChangeCount:NSChangeDone];
    
    
    NSLog(@"Add Task Button Clicked!");
}

- (void)removeTask:(id)sender {
    
    // If no array, quit
    if (!self.tasks) {
        return;
    }
    
    [self.tasks removeObjectAtIndex:]
    
}


#pragma mark - Data Source Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    // This Table View displays the tasks array
    // so the number of entries in the table view will be
    // the same as the number of objects in the array
    return [self.tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // Return the item from tasks that corresponds to the cell
    // that the table view wants to display
    return [self.tasks objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // When the user changes a task on the table view,
    // update the tasks array
    [self.tasks replaceObjectAtIndex:row withObject:object];
    
    // ...and then flag the document as having unsaved changes
    [self updateChangeCount:NSChangeDone];
}



@end
