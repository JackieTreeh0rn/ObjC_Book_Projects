//
//  ZGCLogger.h
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGCLogger : NSObject

@property (nonatomic) NSDate *lastTime;

- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t; //action methods always take one argument - the object that is sending the action (a timer object in this case)

@end
