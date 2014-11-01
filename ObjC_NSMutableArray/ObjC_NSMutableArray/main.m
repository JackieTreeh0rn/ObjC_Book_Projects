//
//  main.m
//  ObjC_NSMutableArray
//
//  Created by EvilKernel on 9/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // NSMutableArray //
        /* NSMutableArray is a similar to an instance of NSArray but you can add, remove, and reorder pointers.
         It is a subclass of NSArray  */
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 *60.0];
        
        // Create an empty mutable array
        NSMutableArray *dateList = [NSMutableArray array]; //or [[NSMutableArray Alloc] init]
        
        // Populate Mutable array with two dates
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        
        // Add yesterday to the beginning of the list
        [dateList insertObject:yesterday atIndex:0];
        
        //iterate over the array
        //note: when using fast enumeration with mutable array you are not allowed to add/remove items while iterating - use standard 'for-loop'
        // if you need to add or remove items while iterating (see NSArray project for reference).
        for (NSDate *d in dateList) {
            NSLog(@"Here is a date: %@", d);
        }
        
        //Remove yesterday
        [dateList removeObjectAtIndex:0];
        NSLog(@"Now the first date is %@", dateList[0]);
         
                                    
        

        
        
    }
    return 0;
}

