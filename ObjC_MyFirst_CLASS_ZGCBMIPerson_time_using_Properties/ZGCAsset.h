//
//  ZGCAsset.h
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 10/3/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZGCEmployee; //adding header for ZGCEmployee for a child to parent relationship below

@interface ZGCAsset : NSObject

//properties for asset object
@property (nonatomic, copy) NSString *label;
@property (nonatomic) unsigned int resaleValue;
@property (nonatomic, weak) ZGCEmployee *holder; // child-to-parent pointer.  weak, prevents strong reference cycles (which cause memory leaks)

@end
