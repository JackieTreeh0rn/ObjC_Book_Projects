//
//  main.m
//  ObjC_Arrays_Old_Style_Array_Methods
//
//  Created by EvilKernel on 9/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 *60.0];
        
        // before literal syntax was introduced, devs used class method 'arrayWithObjects' to create arrays
        NSArray *datelist = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil]; //nil at the end required
        
        // the syntax usd to access array items is known as 'subscripting' before subscripting 'objectAtIndex:' nethod was used
        NSLog(@"The first date is %@", [datelist objectAtIndex:0]);
        NSLog(@"The third date is %@", [datelist objectAtIndex:2]);
        
        //These old methods are not deprecated.  It can be useful to rever to these older methods when your codes makes use of too many brackets for messaging, etc. Makes your code easier to read.  Use at will.
        
    }
    return 0;
}

