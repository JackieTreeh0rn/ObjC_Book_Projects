//
//  ZGCEmployee.m
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/30/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCEmployee.h"
#import "ZGCAsset.h" //using import in this case - @class is not sufficuent as more is needed to know.

//----Class extensions --- (makes a declaration private/internal use only)
@interface ZGCEmployee()

{
    NSMutableSet *_assets; // hiding mutability by making this declaration private. this will force coder to use the addAsset: method to interact with the array which is only advertised as an NSArray in the declarations header // could also use a @property here...
}

@property (nonatomic) unsigned int officeAlarmCode; // making this private as it should be known to object only

@end
//-------------------------


@implementation ZGCEmployee

- (double)yearsOfEmployment
{
    // Do I have a nil hireDate?
    if (self.hireDate) {
        //NSTimeInterval is the same as double typedef
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0; //seconds per year
    }else{
        return 0;
    }
}

/* you can override an inherited method in a subclass by writing 
 a new implementation (original declaration must remain the same) */
- (float)bodyMassIndex
{
    // return 19.0; //overrides output to fixed BMI for instance
  
/* when overriding a method, a subclass can also build on the original
 implementation of the Superclass  rather than replacing it whole. In this
 case we are discounting 10% off their BMI as calculated by the original
 implementation */
    float normalBMI = [super bodyMassIndex]; //instruct to use method at superclass
    return normalBMI * 0.9;
}
    
// acceessors for asset properties
/* here I override the synthetized property method/accessor for 'assets'
for a setter which sets 'assets' to a mutable version of NSArray */
- (void)setAssets:(NSSet *)a
{
    _assets = [a mutableCopy]; // means: assets = an [empty] mutable array
}


//again, overriding synthetized property method
// to return copied version of NSArray above (which is a mutable version)
- (NSSet *)assets
{
    return [_assets copy];
}

- (void)addAsset:(ZGCAsset *)a
{
    // Is assets nil?
    if (!_assets) {
        // create the array
        _assets = [[NSMutableSet alloc] init];
        
    }
    [_assets addObject:a]; //adds an asset object to the mutable array
    a.holder = self; // implementing child-to-parent within existing implementation (easiest approach)
}

- (void)removeAsset:(ZGCAsset *)a //removes asset at supplied index
{
    if (_assets.count < 1) {
        NSLog(@"This employee owns no more assets...");
    }
    [_assets removeObject:a];
    a.holder = nil; // removing child-to-parent reference
}


- (unsigned int)valueOfAssets
{
    // sum up the resale value of assets
    unsigned int sum = 0;
    for (ZGCAsset *a in _assets) { // must count each asset in array as each employee object owns one array of assets, as per main()
        sum += [a resaleValue];
    }
    return sum;
    
}

// overriding description method for illustration purposes to track dealloaction
- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

// overriding dealloc method to illustrate deallocation (will not actually dealloc like this
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
