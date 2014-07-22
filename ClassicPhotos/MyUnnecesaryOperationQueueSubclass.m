//
//  MyUnnecesaryOperationQueueSubclass.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "MyUnnecesaryOperationQueueSubclass.h"

@interface MyViewController : UIViewController
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation MyUnnecesaryOperationQueueSubclass

//Do not run this method.  it is example only and it proably does not work
- (void)ExampleAddOperations {
    NSOperationQueue *myQueue = [NSOperationQueue new];
    id self_ = [UIViewController new];
    // Create a weak reference
    __weak MyViewController *weakSelf = self_;
    
    // Add an operation as a block to a queue
    
    [myQueue addOperationWithBlock: ^ {
        
        NSURL *aURL = [NSURL URLWithString:@"http://www.somewhere.com/image.png"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:aURL options:NSDataReadingUncached error:&error];
        UIImage *image = nil;
        if (data)
        image = [UIImage imageWithData:data];
        
        // Update UI on the main thread.
        [[NSOperationQueue mainQueue] addOperationWithBlock: ^ {
            weakSelf.imageView.image = image;
        }];
        
    }];
}
@end
