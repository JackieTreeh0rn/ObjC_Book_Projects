//
//  ZGCConstants.m
//  ObjC_Constants
//
//  Created by EvilKernel on 11/9/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCConstants.h"

NSString * const ZGCBlenderName = @"My Blender";

@implementation ZGCConstants


- (void)setSpeed:(blenderSpeed)x
{
    speed = x;
}

- (blenderSpeed)getSpeed;
{
    return speed;
}

@end
