//
//  main.m
//  ObjC_ComputerName
//
//  Created by EvilKernel on 8/24/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSHost *hostname = [NSHost currentHost]; //initialize a pointer to NSHost instance named hostname.  Using CLASS method ;'currentHost' which returns current hostname process
        NSString *myHostName = [hostname name]; //initialize a pointer to an instance of NSString / using NSHost instance method 'name' which returns current hostname
        NSLog(@"My hostname is %@",myHostName); //Printing it out with NSLog function
        
    }
    return 0;
}