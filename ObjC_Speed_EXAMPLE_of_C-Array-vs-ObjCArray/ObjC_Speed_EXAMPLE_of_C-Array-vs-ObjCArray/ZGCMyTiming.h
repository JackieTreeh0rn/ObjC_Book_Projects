//
//  ZGCMyTiming.h
//  ObjC_Speed_EXAMPLE_of_C-Array-vs-ObjCArray
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USE_C_ARRAYS 0
#define LOAD 1

@interface ZGCMyTiming : NSObject

+ (void)start;
+ (double)elapsedTimeInMicroSeconds;

@end
