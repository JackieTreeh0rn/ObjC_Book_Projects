//
//  ZGCLogger.m
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCLogger.h"

@implementation ZGCLogger

- (NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil; //static variable (sticks around so only one instance of NSDateFormatter is used for the entire process)
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter"); //this technically should only happen once and the global variable sticks around for the entire duration. A static variable, whether declared inside a function or outside, is initialized only once with the value provided on the declaration line.
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

@end
