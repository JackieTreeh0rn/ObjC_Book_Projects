//
//  main.m
//  ObjC_NSArray_DateList
//
//  Created by EvilKernel on 9/8/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //// NSARRAY ///
        /* NSArray is another objective-c class which holds a list of pointers to other pointers */
        //Example//
        
        // Create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 *60.0];
        
        /* Create Array containing all three.  Like NSString, NSArray has a literal syntax for creating
        instances. //sorrounded by brackets, preceeded with @. */
        NSArray *dateList = @[now, tomorrow, yesterday];
        
        /* an instance of NSArray is immutable, Once an NSARray has been created, you can never add or 
         remove a poiner from that array. Nor can you change the order of the poiners in that array */
        
        // Arrays are ordered lists and items are accessed via their index.  indexes are zero based (start at0)
        // you can access items in array  using array name and index # in square bracket.
        
        // Print a couple of dates
        NSLog(@"The first date is %@", dateList[0]);
        NSLog(@"The third date is %@", dateList[2]);
        
        // How many datesa re in the array. 'count' method counts items (returns NSUInteger)
        NSLog(@"There are %lu dates", [dateList count]);
        
        // Iterating over array - using datecount with traditional 'for-loop'
        NSUInteger datecount = [dateList count];
        for (int i = 0; i < datecount; i++) {
            NSDate *d = dateList[i];
            NSLog(@"Here is a date: %@", d);
            
            
        // Iterating over array - using built-in for-loop called 'fast enumeration' used on arrays.
            for (NSDate *d in dateList){
                NSLog(@"Here is a date: %@", d);
                
            }
            
            
        }
     
        
        
        
    }
    return 0;
}

