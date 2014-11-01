//
//  main.c
//  Buffers & The Heap
//
//  Created by EvilKernel on 8/1/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> //malloc() and free() are in stdlib.h

//Buffer space in The Heap is allocated via the malloc() function and freeded/returned to the heap via the free() function


int main(int argc, const char * argv[])
{
    /* Buffer is memory allocatd in a region of memory called the "The Heap".  The Heap is amemory outside a function's "frame" in the stack, It is independent of any
     function's frame and can be shared across many fuctnions */
     // Declare a Pointer
    float *startOfBuffer;
    
    //Ask to use some bytes from the heap
    // StartOfBuffer is a pointer to the address of the first floating point number in the buffer
    startOfBuffer = malloc(1000 * sizeof(float));
    
    // ...use Buffer here...
    
    // Relinquish your claim on the memory so it can be reused
    free(startOfBuffer);
    
    // Forget where the memory is
    startOfBuffer = NULL;
    
    return 0;
}

