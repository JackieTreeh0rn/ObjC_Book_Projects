//
//  ZGCPerson.m
//  ObjC_BMI_time
//
//  Created by EvilKernel on 9/23/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// -- THIS IS AN IMPLEMENTATION FILE (.m) for the class - used to implement the methods declared in the header file (.h) -- //
// use control+CMD+arrows to switch between header and implementation

#import "ZGCPerson.h"   //import header file


@implementation ZGCPerson

- (float)heightInMeters
{
    return _heighInMeters;
}

- (void)setHeightInMeters:(float)h
{
    _heighInMeters = h;
}

- (int)weightInKilos
{
    return _weightInKilos;
}

- (void)setWeightInKilos:(int)w
{
    _weightInKilos = w;
}

- (float)bodyMassIndex
{
    
    return _weightInKilos / (_heighInMeters * _heighInMeters);
    
    // Using "self" (implicit local variable). self is a pointer to the object that is running the method.
    // many devs are regliious about never reading/writing to an instance variable directly.
    /*
     float h = [self heightInMeters];
     return [self weightInKilos] / (h * h); 
     */

}


@end
