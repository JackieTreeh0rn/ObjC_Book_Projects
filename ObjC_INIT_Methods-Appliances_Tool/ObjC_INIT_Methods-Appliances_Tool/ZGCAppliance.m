//
//  ZGCAppliance.m
//  ObjC_INIT_Methods-Appliances_Tool
//
//  Created by EvilKernel on 1/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "ZGCAppliance.h"

@implementation ZGCAppliance

/* Overriding NSObject-inhereted init method. this lets us control how objects
are initilaized. such as, allowing objects to be initialized with their instance
variables set to non nil / non zero values as they are with basic 'init' */

- (instancetype) init {
    // here we are overriding the the standard init method in the super class to call our 'initWithProductName'
    // init method.  This ensure that if a programmer uses standard [alloc] init] it enforces the custom one
    return [self initWithProductName:@"Unknown"];  // using a default value for the name
    
}


/* implementing the new init method which passes an argument to the 
 instance initilization */

- (instancetype)initWithProductName:(NSString *)pn {
    // Call NSObject's init method
    self = [super init];
    
    // Did it return something non nil?  (we can also do one line:  "if (self = [super init])" to eliminate above line as well)
    if (self) {
        _productName = [pn copy];  // assigning product name value, as per argument
        _voltage = 120; // Giving the voltage a starting value as well (we can use plain assigments (_variable = ) or accessors methods [self setProductName] based on preference.  most progs. prefer plain assigments as technocally instnace isnt initialized yet.
        
    }
    
    // return a pointer to the new object
    // now whenever we initialize an isntance of zgcappliance it will start out with a voltage and part name already set right off the bat.
    return self;
}

// overriding the description method to see the above in action
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
    
}

@end
