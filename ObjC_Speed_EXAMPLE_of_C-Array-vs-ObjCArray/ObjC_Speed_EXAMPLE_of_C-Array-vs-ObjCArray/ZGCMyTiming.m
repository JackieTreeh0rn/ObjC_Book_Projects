//
//  ZGCMyTiming.m
//  ObjC_Speed_EXAMPLE_of_C-Array-vs-ObjCArray
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "ZGCMyTiming.h"
#include <sys/resource.h>

@implementation ZGCMyTiming


static struct rusage t1;

+ (void)start
{
    getrusage (RUSAGE_SELF, &t1);
}

+ (double)elapsedTimeInMicroSeconds;
{
    struct rusage t2;
    getrusage (RUSAGE_SELF, &t2);
    double v = ((double) (1000000)) * (double) (t2.ru_utime.tv_sec - t1.ru_utime.tv_sec)
    + (double) (t2.ru_utime.tv_usec - t1.ru_utime.tv_usec);
    return v;
}

@end

