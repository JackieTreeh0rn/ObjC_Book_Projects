//
//  main.c
//  ObjC_C-Arrays
//
//  Created by EvilKernel on 2/4/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // malloc(), free()

/// C ARRAYS /////
/* Similar to how a C string is a list of chracters packed one next to the other in memory
 C arrays are lists of other data types packed right next to the other in memory. As with strings
 you deal with the list by holding onto the address of the first one */


/// C FUNCTION that calculates the average of 3 grades ///
//  float averageFloats(float *data, int dataCount) { <-- replacing to use 'array literal' type below instead of *data
    float averageFloats(float data[], int dataCount) {
    float sum = 0.0;
    for (int i = 0; i < dataCount; i++) {
        sum = sum + data[i];
    }
    return sum / dataCount;
}


int main(int argc, const char * argv[]) {
    
    // Create an array of floats
    float *gradeBook = malloc(3 * sizeof(float));
    gradeBook[0] = 60.2;
    gradeBook[1] = 94.5;
    gradeBook[2] = 81.1;
    
    // Calculate the average using our function
    float average = averageFloats(gradeBook, 3);
    
    // Free the array (value is now stored in above 'average' float variable
    free(gradeBook);
    gradeBook = NULL;
    
    // Output result
    printf("Average = %.2f\n", average);
    
// Using STRING LITERALS  //
    /* to avoid having to use malloc() to allocate a buffer in the heap and free() to 
     free it everytime, you can declare the buffer using the []shortchand (string literal) */
    
    // Declares the array as part of the gram
    float gradeB00k[3];
    gradeB00k[0] = 54.5;
    gradeB00k[1] = 55.23;
    gradeB00k[2] = 23.21;
    float averag3 = averageFloats(gradeB00k, 3);
    // NO Need to free the array, clean up happens automatically when the function returns.
    printf("Average = %.2f\n", averag3);
    
// ARRAY Literals //
    /* There are also Array literals that allow you to initialize a variable */
    float grad3Book[] = {78.4, 23.3, 22.5}; // no need to specify lenght of gradebook as 3 - compiler does it.
    float aver4ge = averageFloats(grad3Book, 3);
    printf("Average = %.2f\n", aver4ge);
    
    
    
    return 0;
}
