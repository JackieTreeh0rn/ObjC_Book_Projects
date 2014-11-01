//
//  main.c
//  STRUCT_WhatDateWillBe_In_4millionYears
//
//  Created by EvilKernel on 7/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// Program to calculate what the date will it be in 4 million seconds (formatted in d-dd-ddd)

#include <stdio.h>
#include <time.h> // including time header

int main(int argc, const char * argv[])
{
    // Present
    struct tm now; //declare a 'struct tm' variable of type/name 'now'. 'struct tm' is part of C library to hold time broken down into its components
    long secondsSince1970 = time(NULL); // declare a variable to hold seconds since 1970 using time() function
    localtime_r(&secondsSince1970, &now); // built-in function. takes address of secondsSince1970, calculates time values, and takes address of struct 'now' populates the various components.
    printf("It has been %ld seconds since 1970\n", secondsSince1970); //how many seconds has it been since been since the first moment in 1970?
    printf("The time right now is %d:%d:%d\n", now.tm_hour, now.tm_min, now.tm_sec); //members of the struct 'tm'
    printf("Today's date is %d-%d-20%d\n\n", (now.tm_mon + 1), now.tm_mday, (now.tm_year - 100)); //month is 0-12 so need to add "1".  Also, forcing milleneal display of number of years
    
    // Future
    struct tm FourMillSec;
    long TotalSecondsin4MilSec = (secondsSince1970 + 4000000);
    localtime_r(&TotalSecondsin4MilSec, &FourMillSec);
    printf("A total of %ld seconds will have transcured in %ld seconds\n", TotalSecondsin4MilSec, (TotalSecondsin4MilSec - secondsSince1970));
    printf("The time in 4 million seconds will be %d:%d:%d\n", FourMillSec.tm_hour, FourMillSec.tm_min, FourMillSec.tm_sec);
    printf("The date in 4 million seconds will be %d-%d-20%d\n\n", (FourMillSec.tm_mon + 1), FourMillSec.tm_mday, (FourMillSec.tm_year - 100));
    
    
    return 0;
}

