//
//  ZGCOwnedAppliance.m
//  ObjC_INIT_Methods-Appliances_Tool
//
//  Created by EvilKernel on 1/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "ZGCOwnedAppliance.h"

#pragma mark - Class extension

@interface ZGCOwnedAppliance ()
{
    NSMutableSet *_ownerNames; // adds mutability to this variable
}

@end

@implementation ZGCOwnedAppliance

#pragma mark - INIT methods

- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n {
    // Call the superclass's initializer
    if (self = [super initWithProductName:pn]) {
        // Create a set to hold owners names
        _ownerNames = [[NSMutableSet alloc] init];
        
        // is the first owner name non-nil?
        if (n) {
            [_ownerNames addObject:n];
        }
    }
    // Return a pointer to the new object
    return self;
}

// Overriding superclass init method (just as with parent class, in case programmer does not init this class properly (using the superclass init and thus bypassing the 'Owner' argument).  Here will will just call our actual init method we want (the one we declared for this specific class)
- (instancetype)initWithProductName:(NSString *)pn {
    return [self initWithProductName:pn firstOwnerName:nil];
    
    /* note that we do not need to override the standard 'init' mthod in this class.  There is no init implementation in ZGCOwnedAppliance
        so init would just trigger the init method we already implemented in ZGCAppliance class, which in turn already calls [self initWithProductName:@"Unknown"].  self in this case becomes the instance of ZGCOwnedAppliance so it calls our initWithProductName: ovrride here which calls our ultimate init method, the [self initWithProductName:pn firstOwnerName:nil] we delcared nad omplemented here. */
    
    
}


#pragma mark - Methods
- (void)addOwnerName:(NSString *)n {
    [_ownerNames addObject:n];
    
}

- (void)removeOwnerName:(NSString *)n {
    [_ownerNames removeObject:n];
    
}

- (NSSet *)ownerNames { // overriding synthetized method to return an NSMutableSet as a NSSet as expected
    return [_ownerNames copy];
}

@end
