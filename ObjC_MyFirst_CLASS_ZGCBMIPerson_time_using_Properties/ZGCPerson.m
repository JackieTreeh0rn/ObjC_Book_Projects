//
//  ZGCPerson.m
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/30/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCPerson.h"


@implementation ZGCPerson


- (float)bodyMassIndex
{
    // Using "self" (implicit local variable). self is a pointer to the object that is running the method.
    // many devs are regliious about never reading/writing to an instance variable directly.
    
     float h = [self heightInMeters];
     return [self weightInKilos] / (h * h);
    
    
}


@end
