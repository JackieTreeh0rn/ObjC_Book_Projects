//
//  ZGCAppliance.h
//  ObjC_INIT_Methods-Appliances_Tool
//
//  Created by EvilKernel on 1/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGCAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// declaring a new init method that takes an argument
// this allows us to initialize instances of objects with some set values off the bat (product name in this case)
- (instancetype)initWithProductName:(NSString *)pn; //The designated initiliazer

@end
