//
//  ZGCPerson.h
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/30/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGCPerson : NSObject

// Using properties. Properties are a shorthand for automatically declaring and implementing accessor methods. it simplifies code by making declarations and implementations 'implicit'.

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;



// only declaring this method explicitely for calculating BMI.  Setter/getter accessors
// for remaining ones automatically taken care of by '@property' shorthand.

// BMIPerson will have a method to calculate the Body Mass Index
- (float)bodyMassIndex;




@end
