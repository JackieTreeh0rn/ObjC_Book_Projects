//
//  main.c
//  BeerSong
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>

// A Function that calls itself. in this example, with the song Beer on the wall
// add function that sings/outputs the song
void singSongFor(int numberofBottles)
{
    if (numberofBottles == 0) {
        printf("There are simply no more bottles of beer on the wall.\n\n");
    } else {
        printf("%d bottles of beer on the wall, %d bottles of beer.\n", numberofBottles, numberofBottles);
        int oneFewer = numberofBottles - 1;
        printf("Take one down, pass it around, %d bottles of beer on the wall.\n\n", oneFewer);
        singSongFor(oneFewer); //This function calls itself!!
        
        // Print message just before the function ends (this one executes last, once IF condition is TRUE and there are no more bottles
        printf("Put a bottle in the recycling, %d empty bottles in the bin.\n", numberofBottles);
    }
}




int main(int argc, const char * argv[])
{
    // We coiuld sing 99 verses, but 4 is easier to think about
    singSongFor(4);
    return 0;
}

