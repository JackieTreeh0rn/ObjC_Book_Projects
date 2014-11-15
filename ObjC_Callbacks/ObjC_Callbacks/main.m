//
//  main.m
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// CALLBACKS //
// TARGET-ACTION CALL BACK //

#import <Foundation/Foundation.h>
#import "ZGCLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ZGCLogger *logger = [[ZGCLogger alloc] init];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
                          
        /* event driven programs use an object which sits listetning for events. it is always running until told to stop
        when an event happens, the run loop causes a call back to occur */
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
