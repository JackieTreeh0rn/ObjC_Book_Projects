//
//  ZGCObserver.m
//  ObjC_Callbacks
//
//  Created by EvilKernel on 1/26/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "ZGCObserver.h"

@implementation ZGCObserver

// KVO - this is the message that is sent to the reeiver from the KVO in main //
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"Observed: %@ of %@ was changed from %@ to %@", keyPath, object, oldValue, newValue);
}

@end
