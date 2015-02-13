//
//  main.m
//  ObjC_Speed_EXAMPLE_of_C-Array-vs-ObjCArray
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGCMyTiming.h"

// C-arrays take up less space and they are much faster //
// Run some Tests //
/* Run the program from the command line, and monitor the memory usage of its process with the Activity Monitor app. Compare the elapsed times and memory usages. */

//  compile with 0 or 1
//  #define USE_C_ARRAYS 0
//  compile with 1, 10, or 100
// #define LOAD 1

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        typedef unsigned long number_type;
        const number_type N = LOAD * 1000000;
        [ZGCMyTiming start];
#if USE_C_ARRAYS
        NSLog (@"Using C array...");
        number_type *numbers = malloc (N * sizeof (number_type));
        for (number_type x = 0; x < N; ++x) {
            numbers [x] = arc4random_uniform (1024);
        }
#else
        NSLog (@"Using NSArray array...");
        NSMutableArray *numbers = [NSMutableArray array];
        for (number_type x = 0; x < N; ++x) {
            [numbers addObject:[NSNumber numberWithLong:arc4random_uniform (1024)]];
        }
#endif
        NSLog (@"Elapsed time: %f microseconds", [ZGCMyTiming elapsedTimeInMicroSeconds]);
        
        NSLog (@"Sleeping for 30 seconds...");
        sleep (30);
        NSLog (@"Done.");
    }
    return 0;
}

