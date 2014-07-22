//
//  MyLengthyOperation.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "MyLengthyOperation.h"

/*
 Steps to create a custom nsoperation 
 
 1) subcalss NSOperation
 2)override main methos
 3) create an auto realease pool inside of the main method
 4) put code in the auto release pool.  you do this because apparently you do not access to the autorelease pool of the main thread.
 
 
 */

@implementation MyLengthyOperation

- (void)main { @autoreleasepool {
    for (int i = 0; i < 10000; ++i) {
        //if the operation has been cancled, there is not reason to continue the thread
        if (self.isCancelled) {
            break;
        }
        NSLog(@"%f", sqrt(i));
    }
}}

@end
