//
//  main.m
//  ObjC_Blocks_NSNotificationCenter - Challenge
//
//  Created by EvilKernel on 12/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGCLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
     //   ZGCLogger *logger = [[ZGCLogger alloc] init]; //object we are using for the callbacks
        
        
        /// ++ NOTIFICATION CENTER Using method that takes a BLOCK as an argument instead of a callback approach from before ++ //
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification
                                                          object:nil
                                                           queue:[NSOperationQueue mainQueue]
                                                      usingBlock:^(NSNotification *note){
                                                          
                                                          NSLog(@"Time zone has been changed to %@", [NSTimeZone systemTimeZone]);
                                                          
                                                      }];
    
                                                                
        NSLog(@"Current Time Zone is %@", [NSTimeZone systemTimeZone]);
        
        
        /* event driven programs use an object which sits listetning for events (NSRunLoop). it is always running until
         told to stop when an event happens, the run loop causes a call back to occur. keeps the thread running
         waiting for an event (button press, timer, etc.etc)
         */
        [[NSRunLoop currentRunLoop] run]; //
    }
    return 0;
}
