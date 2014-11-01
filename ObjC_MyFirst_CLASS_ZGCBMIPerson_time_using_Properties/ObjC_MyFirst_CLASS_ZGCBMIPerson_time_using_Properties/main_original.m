
/*
 
 
//
//  main.m
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/29/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//


#import <Foundation/Foundation.h> //angled brackets tells the compiler that Foundation.h is a precompiled header found in the apple libs

// #import "ZGCPerson.h" //importing my first class - ZGCPerson.  The quotation marks tell compiler to look for header within current project

#import "ZGCEmployee.h" //importing subclass header only - superclass header already imported in subclass's header
#import "ZGCAsset.h" // importing header for asset class.

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // Creating instance of ZGCPerson CLASS using the subclass
        // an instance of a subclass can stand in for an instance of th superclass because it inherits everything in the superclass. you can use the subclass anywhere. ie, ZGPerson *robert = [[ZGEmployee alloc] init]
        ZGCEmployee *robert = [[ZGCEmployee alloc] init];
        
        // give the instance variables values - dot notation sends either a get or set message depending on how its being used (ie. it will call a getter or setter method)
        robert.heightInMeters = 1.8;  // using dot notation instead of accessor methods []
        robert.weightInKilos = 96; // dot notation is not like members in struct. you are still messaging
        robert.employeeID = 1245764;
        robert.hireDate = [NSDate dateWithNaturalLanguageString:@"January 6th, 2003"];
        
        // Log the instance variables using getters
        float height = robert.heightInMeters;
        int weight = robert.weightInKilos;
        NSLog(@"Robert's height is %.2f meters and weighs %d kilos", height, weight);
        NSLog(@"Employee #%u hired on %@", robert.employeeID, robert.hireDate);
        
        // Log BMI
        float bmi = robert.bodyMassIndex; // using dot notation again
        double years = robert.yearsOfEmployment;
        NSLog(@"Robert has a BMI of %.2f, and has worked with us for %.2f years", bmi, years);
    
        
        
    }
    return 0;
}

 
*/