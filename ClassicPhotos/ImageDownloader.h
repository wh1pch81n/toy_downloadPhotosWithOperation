//
//  ImageDownloader.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import <Foundation/Foundation.h>
//1
#import "PhotoRecord.h"

//2
@protocol ImageDownloaderDelegate;

@interface ImageDownloader : NSOperation

@property (nonatomic, assign) id <ImageDownloaderDelegate> delegate;

//3
@property (nonatomic, readonly, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readonly, strong) PhotoRecord *photoRecord;

//4
- (id)initWithPhotoRecord:(PhotoRecord *)record atIndexpath:(NSIndexPath *)indexPath delegate:(id<ImageDownloaderDelegate>)theDelegate;

@end

@protocol ImageDownloaderDelegate <NSObject>
//5
- (void)imageDownloaderDidFinish:(ImageDownloader *)downloader;

@end

#pragma mark - 1
/**
 Import the photo record so that you can independently set the image property of the Photorecord once it is sucesfully downloaded.  If downloading fails, set its failed value to YES
 */

#pragma mark - 2
/**
 Declare a delegate so that you can notify the caller once the operation is finished
 */

#pragma mark - 3
/**
 declare indexPathInTableView for convenience so that once the operation is finished, the caller has a reference to where this operation belongs to
 */

#pragma mark - 4
/**
 declare a designated initializer
 */

#pragma mark - 5
/**
is your delegat method, pass the operation back as an object.  the caller can access both indexpathInTableView and photoRecord
*/