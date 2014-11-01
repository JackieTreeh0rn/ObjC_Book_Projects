//
//  ZGCEmployee.h
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/30/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCPerson.h"

@class ZGCAsset; // @class can be used with header files instead of import as it does not need all of the info #import provides, just enough to read declarations. it is faster for this purpose.


@interface ZGCEmployee : ZGCPerson   // ZGCEmployee is a subclass of ZGCPerson (my original class)


//some properties for employee object
// properties will automatically create _instanceVariables as well as synthetize setter and getter methods for you
// both on primitive types declarations as well as objects type declarations, like NSDate, NSString, etc (typedefs as they are called)
@property (nonatomic) unsigned int employeeID;

@property (nonatomic) NSDate *hireDate;  // points to an object
// @property (nonatomic, copy) NSArray *assets; //point to an object
@property (nonatomic, copy) NSSet *assets; // switched to NSSet from NSArray (as assets do not need indexing - faster approach)

// method for calculating years of employment
- (double)yearsOfEmployment;

// method to add asset objects to an array
- (void)addAsset:(ZGCAsset *)a;

// method to remove asset from an array
- (void)removeAsset:(ZGCAsset *)a;

// method for calculating value of assets
- (unsigned int)valueOfAssets;



@end
