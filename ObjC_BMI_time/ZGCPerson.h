//
//  ZGCPerson.h
//  ObjC_BMI_time
//
//  Created by EvilKernel on 9/23/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// -- THIS IS A HEADER FILE (.h) - used for declarations of instance variables and methods -- //


#import <Foundation/Foundation.h>

@interface ZGCPerson : NSObject


{
    /* MY FIRST CLASS - ZGCBMIPerson */
    // used to calculate BMI (this is a conversion from chapter 11 BMI excersice)
    // instance variables are declared here within curly braces
    // by convention, with a "_" underscore prefix to deferintiate them from local variables when reading code
    float _heighInMeters;
    int _weightInKilos;
    
}


// ZGCPerson wll have these methods to READ and SET its instance variables (aka. acessor methods)
- (float)heightInMeters; //getter methods by convention are given the name of the intance variables minus the _
- (void)setHeightInMeters:(float)h; //setter methods start with set followed by the name of the instance var.
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;



// BMIPerson will have a method to calculate the Body Mass Index
- (float)bodyMassIndex;




@end
