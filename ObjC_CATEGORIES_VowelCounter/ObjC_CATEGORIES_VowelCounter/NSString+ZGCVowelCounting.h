//
//  NSString+ZGCVowelCounting.h
//  ObjC_CATEGORIES_VowelCounter
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Categories allow you to add methods to any existing class. For exmaple, apple does
    not share source code for the NSString class but we can use a category ti add new
    methods */

@interface NSString (ZGCVowelCounting)

- (int)zgc_vowelCount;  // we are using _ in this method name.  this is because any category method overrides same method on parent class. it is safeguard in case class gets updated with a new method by apple.

@end
