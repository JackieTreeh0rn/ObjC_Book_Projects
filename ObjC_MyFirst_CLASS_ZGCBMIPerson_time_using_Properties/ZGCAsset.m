//
//  ZGCAsset.m
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 10/3/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCAsset.h"

@implementation ZGCAsset

// overriding description method for illustration purposes to track dealloaction - this overrides what %@ returns for the object.
- (NSString *)description
{
    // is holder non nil?
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%u, assigned to %@>", self.label, self.resaleValue, self.holder];
    }else{
        return [NSString stringWithFormat:@"<%@: $%u, unassigned>", self.label, self.resaleValue];
    }
}

// override dealloc method to illustrate
// how ARC deallocaction activity (will not actually dealloc this way, just log)
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
