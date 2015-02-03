//
//  main.m
//  ObjC_CATEGORIES_DateMonger_Challenge
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+ZGCDateConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int dd = 10;
        int mm = 11;
        int yy = 2015;
        NSDate *myDate = [NSDate zgc_dateByIntYear:yy month:mm day:dd]; // using category class method
        
        NSLog(@"%@", [myDate zgc_dateFormatter]); // using category instance method to format date
        
    }
    return 0;
}
