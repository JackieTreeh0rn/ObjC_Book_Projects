//
//  main.m
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

///// CALLBACKS /////
/* A callback lets you write a piece of code and then associate that
 code with a particular event (such as a button press, a time elapses, memory is low, system connects to network etc.
 When the event happens, your code is executed */

#import <Foundation/Foundation.h>
#import "ZGCLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ZGCLogger *logger = [[ZGCLogger alloc] init]; //object we are using for the callbacks
        
        
        /// ++ TARGET-ACTION CALL BACK ++ (using a Timer object in this example) ///
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0   // __unused supreses error about 'unused variable (timer)
                                                                   target:logger //target is the instance of ZGCLogger object in this case
                                                                 selector:@selector(updateLastTime:) // action is the selector (the callback method)
                                                                 userInfo:nil
                                                                  repeats:YES];
        
        /// ++ HELPER OBJECT CALL BACK ++  aka 'delegates/data sources' (using NSURLConnection in this example) ///
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger // ZGCLogger object is the NSURLConnection delegate
                                                                      startImmediately:YES];
        
        
        /// ++ NOTIFICATION CENTER CALL BACK ++ (using timezone change notification in this example)
        [[NSNotificationCenter defaultCenter] addObserver:logger // logger again is the object acting as observer
                                                 selector:@selector(zoneChange:) // method to invoke on observer
                                                     name:NSSystemTimeZoneDidChangeNotification // type of notificaiton to listen for
                                                   object:nil];
        
        
        /*  event driven programs use an object which sits listetning for events (NSRunLoop). it is always running until
            told to stop when an event happens, the run loop causes a call back to occur. keeps the thread running
            waiting for an event (button press, timer, etc.etc) 
        */
        [[NSRunLoop currentRunLoop] run]; //
    }
    return 0;
}
