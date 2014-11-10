//
//  ZGCConstants.h
//  ObjC_Constants
//
//  Created by EvilKernel on 11/9/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

// Constants can be set with #define (eg. #define M_PI = 3.14159xxxxx) or as Global variableds with ENUM or 'const'. global var. is prefered.
// using enum to declare constants - NS_ENUM is new foundation framework approach to ENUM.  NS_ENUM main adv. lets you specify type (int, char, long, double, etyc)//
typedef NS_ENUM(char, blenderSpeed){
    ZGCfrapee,
    ZGCcrush,
    ZGCblendd,
    ZGCicy,
};

// constants can also be declared this way.  extern means it is implemented externally (in the .m file for the class). const means value will not change
extern NSString * const ZGCBlenderName;

@interface ZGCConstants : NSObject

//with enum, must declare global variable as so.
{
    blenderSpeed speed;
}

//then declare implementation like this.
- (void)setSpeed:(blenderSpeed)x;
- (blenderSpeed)getSpeed;


@end
