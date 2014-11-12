//
//  ZGCConstants.m
//  ObjC_Constants
//
//  Created by EvilKernel on 11/9/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCConstants.h"

NSString * const ZGCBlenderName = @"My Blender"; // implementing constant

@implementation ZGCConstants


- (void)setSpeed:(blenderSpeed)x // this is all you need to set the constant after enum
{
    speed = x;
}

- (blenderSpeed)getSpeed; // optional, added method to get speed.
{
    return speed;
}

@end
