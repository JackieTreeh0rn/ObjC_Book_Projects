//
//  main.m
//  ObjC_TimesTwo
//
//  Created by EvilKernel on 8/28/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    //// OBJECTS & MEMORY //////
    
    @autoreleasepool {
        
        NSDate *currentTime = nil; //pointer set to 'nil'
        NSLog(@"currentTime's value is %p", currentTime); //displays address of 'nil' (0x0). When value is 'nil', no objects are created in Heap memory so, the value of the local variable 'currenttime' (which is part of main's frame and lives in the 'stack') points to 0.
        
        currentTime = [NSDate date]; //no longer nil, now object DOES exist in the heap
        NSLog(@"currentTime's value is now %p", currentTime); // address in heap is shown
        
        // currentTime is a pointer variable to the heap.  it can be set to point to a different NSDate
        sleep(2);
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is now %p", currentTime); // new memory address will be shown.  If you lose orginal pointer to an object, you can no longer access it. original NSDate above was discarted and currentTime now points to new objet in heap (another NSDate).
        
        // You can declare another pointer to store address of the original object
        currentTime = [NSDate date];
        NSDate *startTime = currentTime; //store address of original pointer/date
        NSLog(@"currentTime's value is %p", currentTime);
        sleep(2);
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is now %p", currentTime);
        NSLog(@"address of the original object is %p", startTime);
        
        /// ARC - memory managment
        // ARC (automatic reference counter) keeps track of pointers in the heap.  Before ARC, one had to use code to keep track of how many references (pointers) an object had
        // with ARC enabled, compiler adds code to the project to track object references.  when references reach zero, object is destroyed and memory freed
        // setting pointer to 'nil' causes ARC to decrease the heap count for the pointer by 1
        NSDate *currentTime2 = [NSDate date];
        NSDate *startTime2 = currentTime2;
        NSLog(@"currentTime2 pointer value is %p", currentTime2);
        NSLog(@"starTime2 pointer value is %p", startTime2);
        sleep(2);
        currentTime2 = nil; //currentime2 will lose a reference here. however, since startime2 still has a reference on the original object, its count will remain 1 until startime is out.
        NSLog(@"currentTime2 pointer value is now %p", currentTime2);
        NSLog(@"starTime2 pointer value is now %p", startTime2);



    }
    return 0;
}

