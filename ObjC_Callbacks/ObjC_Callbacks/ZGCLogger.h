//
//  ZGCLogger.h
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGCLogger : NSObject

<NSURLConnectionDelegate, NSURLConnectionDataDelegate> // including protocols to be used (for helper object callbacks). these are predeclared, you use the ones you need from the reference

{
    NSMutableData *_incomingData; // HELPER Object instance variable.  Need mutable-data since we are using asynchornous connection. As chunks of data arrive they will be added to this object
}

@property (nonatomic) NSDate *lastTime; // Target-action property

// TARGET-ACTION callback methods //
- (NSString *)lastTimeString; // returns formatted NSDate object (lastTime)
- (void)updateLastTime:(NSTimer *)t; // target-action methods always take one argument (the object sending the action - a 'timer' object in this case)


// HELPER OBJECT callback methods //
/* using PROTOCOLS in this case (a protocol is a list of method declarations) prearranged set of msgs an obj can send to helper
    they are protocols for NSURLConnection so they are already declared - no need to declare them */


@end
