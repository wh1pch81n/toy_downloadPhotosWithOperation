//
//  MyUnnecesaryOperationQueueSubclass.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUnnecesaryOperationQueueSubclass : NSOperationQueue

#pragma mark - Create a queue
/**
You do not need to subclass NSOperations.  You just need to create it and name it.
 
 @code
 NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
 myQueue.name = @"Download Queue";
 @endcode
 
 @discussion
 Queue is not the same as a thread.  
 A queue can have multiple threads.  The OperationQueues will do some magic to use as many threads as possible.
 
 if You create a queue and add 3 operations to it, it will launch 3 separate threads and each operation runs on its own thread
 
 
*/

#pragma mark - max number of concurent operations
/**
You can set the maximum number of concurrent operations that NSoperationsQueue may run concurrently.

 @code
 myQueue.MaxConcurrentOperationCount = 3; //custom number
 
 //or the default is ok too
 myQueue.MaxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentoperationCount;
 
 @endcode
 
*/

#pragma mark - adding operations to queue
/**
You can add an operation to the queue.  If you are not using arc you should release i right away.  the queue will call start eventually
 
 [myQueue addOperation:downloadOp];
 [downloadOp release]; // manual reference counting
*/

#pragma mark - pending operations
/**
 you can get the currently running and not running operations.  The ones that are complete are evicted from the queue
 
 @code
 NSArray *active_and_pending_operations = myQueue.operations;
 NSInteger count_of_operations = myQueue.operationCount;
 @endcode
 */

#pragma mark - pause a queue
/**
 You can pause a queue
 @code
 // Suspend a queue
 [myQueue setSuspended:YES];
 .
 .
 .
 // Resume a queue
 [myQueue setSuspended: NO];
 @endcode
 
 You can not pause individual operations.  only the queue that surrounds them
 */

#pragma mark - cancel operations

/**
 You can cancel all operations whether they are running or pending.  thats why your NSOperation should check the isCanceled property often.
 @code
 [myQueue cancelAllOperations];
 @endcode
 

 */

#pragma mark - addOperationWithBlock
/**
 If you have a simple operation that probably doesn't need a subclass of NSOperations, you could try executing it in a block
 @code
 see the implementation of the example method
 
 @endcode
 
 remember to prevent retain cycles
 */
-(void)ExampleAddOperations;

@end