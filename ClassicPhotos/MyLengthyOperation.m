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


/**
 You normally should not have to override this method.
 If you do, you will have to take care of properties such as isExecuting, isFinished, isConcurrent, and isReady.
 
 When you run the operation on a queue, the queue will call the "start" method and perform the stuff in the main.
 
 If you call start on an instance of NSOperation without adding it to the queue, the operation will run on the main loop.
 */
- (void)start {
    [super start];
}

/**
 You can make one NSOperation queue dependant on another.  If you make NSOperation A dependent on NSOperation B, then even if you call "start" on A, it won't be run until B's isFinished property is true.
 
 @code
 
 MyDownloadOperation *downloadOp = [[MyDownloadOperation alloc] init]; // MyDownloadOperation is a subclass of NSOperation
 MyFilterOperation *filterOp = [[MyFilterOperation alloc] init]; // MyFilterOperation  is a subclass of NSOperation
 
 [filterOp addDependency:downloadOp];//add dependency
 [filterOp removeDependency:downloadOp];//remoce dependency
 
 @endcode
 */
- (NSArray *)dependencies {
    return [super dependencies];
}


/**
 The NSOperationQueue will look at all the NSOperation instances and execute the high priority ones first. If they have the same priority, it will execute them FIFO.
 
 the priorites are listed as follows:
 NSOperationQueuePriorityLow
 NSOperationQueuePriorityNormal
 NSOperationQueuePriorityHigh
 NSOperationQueuePriorityVeryHigh
 */
- (NSOperationQueuePriority)queuePriority {
    return [super queuePriority];
}

/**
 Perform this after the code has been run.  
 There is no guarantee that this will be run on the main queue.
 
 */
- (void)setCompletionBlock:(void (^)(void))block {
    [super setCompletionBlock:block];
}


#pragma mark - Other notes

/**
 If you need to add some values and pointers to an operation, it is good practice to create your own designated initializer
 */
- (id)initWithNumber:(NSNumber *)start string:(NSString *)string //example
{
    if (self = [super init]) {
        
    }
    return self;
}

/**
 If you want your NSOperation to return something, it is good practice to send it back using a delegate method
 
 @code
 [(NSObject *)self.delegate performSelectorOnMainThread:@selector(delegateMethod:) withObject:object waitUntilDone:NO];
 @endcode
 
 */

/**
 You can not enqueue the ssame operation again.  One it is added to the queue, you should give up ownership.  If you want to run the same code again, just create a new instance
 */

/**
 A finished operation can not be restarted
 */

/**
 if you cancel an NSOperation, it will not cancel right away.  It will cancel either when it is done or when someone checks "isCancled"
 */

/**
 isFinished will be set to YES if it ran succesfully, unseccessfully, or is canceled.  therefore you should not assume that everything whent well; especially if there are dependances in your code
 */
@end


