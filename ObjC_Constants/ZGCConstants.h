//
//  ZGCConstants.h
//  ObjC_Constants
//
//  Created by EvilKernel on 11/9/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(char, blenderSpeed){
    frapee,
    crush,
    blendd,
    icy,
};

extern NSString * const ZGCBlenderName;

@interface ZGCConstants : NSObject
{
    blenderSpeed speed;
}

- (void)setSpeed:(blenderSpeed)x;
- (blenderSpeed)getSpeed;


@end
