//
//  main.m
//  ObjC_NSMutableArray_Grocery_List_Challenge
//
//  Created by EvilKernel on 9/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Define Mutable array
        NSMutableArray *groceries = [[NSMutableArray alloc] init];
        
        //Define Grocery items
        [groceries addObject:@"Loaf of Bread"];
        [groceries addObject:@"Gallon of Milk"];
        [groceries addObject:@"Stick of Butter"];
        
        NSLog(@"My Grocery list is:");
        for (NSString *d in groceries) {
            NSLog(@"%@", d);

        }
        
        
        
        
    }
    return 0;
}

