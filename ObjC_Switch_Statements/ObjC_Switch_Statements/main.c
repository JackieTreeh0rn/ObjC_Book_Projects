//
//  main.c
//  ObjC_Switch_Statements
//
//  Created by EvilKernel on 2/13/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    // If statements can work ike this to check a variable for a set of values
    int yeastType = 5;
    
    if (yeastType == 1) {
        // makeBread();
    }else if (yeastType == 2) {
        // makeBeer();
    }else if (yeastType == 4) {
        // makeWine()
    }else {
        // makeFuel();
    }
    
    
    // To make the above easier, C has SWITCH statement
    int yeastTypee = 5;
    
    switch (yeastType) {
        case 1: // value of each case must be a constant integer
           // makeBread()
            break; // break statements very important here, without them, execution continues.
        case 2:
        case 4:  // you can combine multiple values to trigger the same code (clasic use of BREAK statement)
           // makeBeer()
            break;
        case 3:
           // makeWine()
            break;
            
        default:
          //  makeFuel();
            break;
    }
    
    return 0;
}
