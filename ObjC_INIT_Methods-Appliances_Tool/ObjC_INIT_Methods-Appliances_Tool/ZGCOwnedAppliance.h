//
//  ZGCOwnedAppliance.h
//  ObjC_INIT_Methods-Appliances_Tool
//
//  Created by EvilKernel on 1/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "ZGCAppliance.h"

@interface ZGCOwnedAppliance : ZGCAppliance

@property (readonly) NSSet *ownerNames;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n; // an initilizer method that takes two arguments

- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end
