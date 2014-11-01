//
//  main.c
//  Robert is Cool - Loop
//
//  Created by EvilKernel on 6/20/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

int main(int argc, const char * argv[])
{
    // USING LOOPS!

    // Using plain non-loop approach.  is repetetive in nature.
    printf("Robert is cool as shit\n");
    printf("Robert is cool as shit\n");
    printf("Robert is cool as shit\n");
    printf("Robert is cool as shit\n");
    printf("Robert is cool as shit\n");
    sleep(1);
    printf("Robert is cool as shit\n");
    sleep(1);
    printf("Robert is cool as shit\n");
    sleep(1);
    printf("Robert is cool as shit\n");
    sleep(1);
    printf("Robert is cool as shit\n\n");
   
    
    // Using WHILE TRUE Loop
    // (think of it as IF statement that repeats itself
    int i = 0;  //declare variable as starting point for conditional, in this case, starts at 0
    while (i < 12) {  //while the variable remains below 12 (ie. WHILE TRUE (while statement remains TRUE)
        printf("%d. Robert is cool as shit\n\n", i);  //...execute code
        i++; //increment value of variable to repeat (LOOP)
    }
    
    
    // Using FOR loop - simplied form of writing a WHILE TRUE loop)
    int j; //declare starting variable again for conditional
    for (j = 0; j < 12; j++) {   // read: start variable at value of 0, WHILE value remains below 12, execute code below, then increment value by two.
        printf("%d. Robert is cool as shit\n\n", j);
    }


    // Using BREAK - break is used to break a loop based upon an IF conditional for a desired result.
    // to find integer in this case that solves the "x + 90 = x to the power of 2" problem"
    int x; // declare a variable to hold integer to be used in the calculation
    for (x = 0; x < 12; x++) {  // use a FOR loop to create a loop while the value is checked for the calculation.  While x is below 12, do the below, then increase value by 1
        printf("Checking i = %d\n", x); //print statement showing value being checked
        if (x + 90 == x * x) { // add an IF statement to check the value. if "x + 90 = x * x"
            break; // BREAK the loop at this point and process the output statement below to show result.  BREAK will only process if above IF statement equals TRUE.
        }
    }
    printf("The answer is %d.\n", x);


    // Using CONTINUE - continue is used to fine tune a conditional during a loop by checking for and eliminating non relevant values or information.
    // to fine tune/streanline same problem above by elimating any number that isn't a multiple of 3
    int y;
    for (y = 0; y < 12; y++) { // same FOR loop as above
        if (y % 3 == 0) { // add an IF statement, in this case, to calculate the remainder of the number and filter out any non multiples of 3.
            continue; // IF (above) TRUE continue...
        }
        printf("Checking i = %d.\n", y); //checking value
        if (y + 90 == y * y) {  // same formula as above
            break;  //now go ahead and process BREAK.
        }
    }
    printf("The answer is %d.\n", y);
    

    // Using DO WHILE loop.
    //It does not check the expression before executing the block.  It ensure the block is executed at least once (do something while something else is TRUE - one long statement basically.
    int z = 0;
    do {
        printf("%d. Robert is cool as shit\n", z);
        z++;
    } while (z < 12);
    
    
    
    
    
    
    
  return 0;
}
    


