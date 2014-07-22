//
//  ImageDownloader.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "ImageDownloader.h"

#pragma mark - 1
/**
 declare private interface properties so that you can change the attributes of properties to RW
 */
@interface ImageDownloader ()
@property (nonatomic, readwrite, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readwrite, strong) PhotoRecord *photoRecord;
@end

@implementation ImageDownloader

#pragma mark - Life Cycle

- (id)initWithPhotoRecord:(PhotoRecord *)record atIndexpath:(NSIndexPath *)indexPath delegate:(id<ImageDownloaderDelegate>)theDelegate {
    if (self = [super init]) {
#pragma mark - 2
        /**
         Set the properties
         */
        self.delegate = theDelegate;
        self.indexPathInTableView = indexPath;
        self.photoRecord = record;
    }
    return self;
}


#pragma mark - downloading image
#pragma mark - 3
/**
 regularly check the value of isCancelled, to make sure the operation terminates as soon as possible
 */
- (void)main {
    #pragma mark - 4
    /**
     use an auto release pool because apple said so
     */
    @autoreleasepool { if (self.isCancelled) return;
        
        NSData *imageData = [NSData dataWithContentsOfURL:self.photoRecord.url]; if(self.isCancelled)return;
        
        if (imageData) {
            UIImage *downloadedImage = [UIImage imageWithData:imageData];
            self.photoRecord.image = downloadedImage;
        }
        else {
            self.photoRecord.failed = YES;
        }
        
        if (self.isCancelled) {
            return;
        }
        
#pragma mark - 5
        /**
         notify the caller on the main thread
         */
        [(id)self.delegate performSelectorOnMainThread:@selector(imageDownloaderDidFinish:)
                                            withObject:self
                                         waitUntilDone:NO];
    }
}

@end
