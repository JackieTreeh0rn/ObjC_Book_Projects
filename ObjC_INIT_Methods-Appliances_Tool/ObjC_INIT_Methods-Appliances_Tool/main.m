//
//  main.m
//  ObjC_INIT_Methods-Appliances_Tool
//
//  Created by EvilKernel on 1/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGCAppliance.h"
#import "ZGCOwnedAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ZGCAppliance *a = [[ZGCAppliance alloc] init];
        NSLog(@"a is %@", a);
        
        [a setProductName:@"Washing Machine"];
        [a setVoltage:240];
        NSLog(@"a is %@", a);
        
        ZGCOwnedAppliance *b = [[ZGCOwnedAppliance alloc] initWithProductName:@"washer" firstOwnerName:@"Robert"];
        NSLog(@"%@", b.ownerNames);
        [b addOwnerName:@"mitchel"];
        NSLog(@"%@", b.ownerNames);
        
        // KEY-VALUE CODING Example - (key-value coding methods are defined in NSOBject so all objects can use it. you can read/set a property using its name
        [b setValue:@"Dish Washer" forKey:@"productName"]; // literally accessing object names. via accessor methods OR instance variasbles themselves if acessors do not exist.
        [b setValue:[NSNumber numberWithInt:320] forKey:@"voltage"]; // wrapping non-object values (int in this case) into an NSNumber. can also do @ NSNumber literal (@320)
        NSLog(@"The product name is %@", [b valueForKey:@"productName"]);
        NSLog(@"%@", b);
    
    }
    return 0;
}
