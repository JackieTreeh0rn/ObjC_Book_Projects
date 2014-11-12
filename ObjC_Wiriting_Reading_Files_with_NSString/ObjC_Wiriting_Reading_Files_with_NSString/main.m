//
//  main.m
//  ObjC_Wiriting_Reading_Files_NSStringNSData
//
//  Created by EvilKernel on 11/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* WRITING A FILE WITH NSString  */
        // Using methods from NSSTring ClASS to create a string and write it to the filesystem
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Robert is cool as shit... I mean, my gowd!\n"]; // adding 10 lines with line breaks to a NSMutableString
        }
        
        // Adding error handling - as recalled, if we need a function to return something in addition to its return value you use pass-by-reference
        // that is, you pass the function (or method) a reference to a variable where it can directly store or manipulate a value.
        // the reference is the memory address for that variable.
        // Declaring pointer to NSError but not instantiating it. the NSError instance/object will only be created if there is an error
        NSError *error; // address in the stack - only.  If instatiated, address of object in heap (pointer-by-reference)
        
        
        // Writing File  AND passing the NSError pointer by reference to the NSString method
        BOOL success = [str writeToFile:@"/tmp/cool.txt" //file paths can be absolute or relative. almost usually you will use absolute path.
                            atomically:YES
                              encoding:NSUTF8StringEncoding
                                 error:&error];  //reference to the pointer (you pass a reference because there is no object yet to pass). error: could also be set to NULL if not interested in error.  You are basically passing an address where it can put a pointer to an instance of NSError
        
        
        // Test the returned BOOL, and query the NSError if the write failed
        if (success) {
            NSLog(@"done writing /tmp/cool.txt");
        }else{
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]); // one of the methods for NSError, (returns error specifics)
        }
        
        
        /* READING A FILE WITH NSString */
        // building string by reading in the contents of a file as ASCII text
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                         encoding:NSASCIIStringEncoding
                                                            error:&error];
        
        if (!str2) { // if it didnt read for whatever reason, output error reason
            NSLog(@"Read failed: %@", [error localizedDescription]);
        }else{
            NSLog(@"resolv.conf looks like this: %@", str2);
        }
        
        
        /* FINDING SPECIAL DIRECTORIES */
        /* apple has created a function that will tell you the right directories for the appropiate purpose */
        
        // in this case, the function returns an array of paths for the users "desktop"
        NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES); //use reference for these constants...
        
        // But I know the user has exactly one desktop directory
        NSString *desktopPath = desktops[0];
        NSLog(@"%@", desktopPath); // other directory constants: NSApplicationDirectory, NSLibraryDirectory, NSCachesDirectory, NSMusicDirectory, NSTrashDirectory, etc)
    }
    return 0;
}
