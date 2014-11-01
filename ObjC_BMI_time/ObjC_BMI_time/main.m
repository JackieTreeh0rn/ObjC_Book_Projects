//
//  main.m
//  ObjC_BMI_time
//
//  Created by EvilKernel on 9/22/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h> //angled brackets tells the compiler that Foundation.h is a precompiled header found in the apple libs
#import "ZGCPerson.h" //importing my first class - ZGCBMIPerson.  The quotation marks tell compiler to look for header within current project

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Creating instance of ZGCBMIPerson CLASS
        ZGCPerson *robert = [[ZGCPerson alloc] init];
        
        // give the instance variables values
        [robert setHeightInMeters:1.8];
        [robert setWeightInKilos:96];
        
        // Log the instance variables using getters
        float height = [robert heightInMeters];
        int weight = [robert weightInKilos];
        NSLog(@"Robert's height is %.2f meters and weighs %d kilos", height, weight);
        
        // Log BMI
        float bmi = [robert bodyMassIndex];
        NSLog(@"Robert has a BMI of %.2f", bmi);

        
        

        
        
    }
    return 0;
}

