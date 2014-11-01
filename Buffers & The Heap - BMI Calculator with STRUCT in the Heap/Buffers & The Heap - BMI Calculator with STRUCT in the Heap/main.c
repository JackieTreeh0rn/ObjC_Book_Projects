//
//  main.c
//  Buffers & The Heap - BMI Calculator with STRUCT in the Heap
//
//  Created by EvilKernel on 8/1/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// This program uses the same excersice as Chapter 11 (BMI) but does in the Heap (creates struct in heap buffer)

#include <stdio.h>
#include <stdlib.h> //malloc() and free() are in stdlib.h

// Declare a 'Person' type struct
typedef struct {
    float heightMeters;
    int weightInKilos;
} Person;

// Function that accepts a Person as a paramenter and calculates BMI (uses pointer in this case to address of p in heap.
float bodyMassIndex(Person *p)
{
    return p->weightInKilos / (p->heightMeters * p->heightMeters);  // "->" is used to dereference pointer to actual value
}


int main(int argc, const char * argv[])
{
    // Allocate memory for one Person struct in the "heap using malloc() function"
    Person *Mikey = (Person *)malloc(sizeof(Person)); //Mikey is a pointer to the heap of "sizeof() person"
    
    // Fill in two members of the struct
    Mikey->weightInKilos = 96;  // "->" is used to dereference pointer to actual value
    Mikey->heightMeters = 1.8;
    
    // Print out the BMI of the original Person
    float MikeyBMI = bodyMassIndex(Mikey);
    printf("Mike has a BMI of %.2f\n", MikeyBMI);
    
    // Let the memory be recycled
    free(Mikey);
    
    // Forget where it was
    Mikey = NULL;
    

}

