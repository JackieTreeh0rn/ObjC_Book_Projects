//
//  main.m
//  ObjC_Writing_Reading_Files_with_NSData
//
//  Created by EvilKernel on 11/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* NSData Object represents a buffer of bytes, like data fetched from a URL */
        
        /* WRITING NSData Object to a FILE */
        // from URL Object
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
        
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic   // constant to write file atomically (see refernce - write to temporary file then renames it to final file. You get the whole file or nothing)
                                   error:&error];
        
        if (!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Write Success!");
        
        /* READING an NSData from a FILE */
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
        
    }
    return 0;
}
