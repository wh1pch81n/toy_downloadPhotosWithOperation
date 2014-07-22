//
//  ImageFiltration.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/22/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#pragma mark - 1
/**
 Since this is going to use imable filtering you need the UIKit and CoreImage frameworks
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "PhotoRecord.h"

#pragma mark - 2
/**
 declare a delegate that will notify the caller once its operation is finished.
 */
@protocol ImageFiltrationDelegate;

@interface ImageFiltration : NSOperation

@property (nonatomic, weak) id <ImageFiltrationDelegate> delegate;
@property (nonatomic, readonly, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readonly, strong) PhotoRecord *photoRecord;

- (id)initWithPhotoRecord:(PhotoRecord *)record atIndexPath:(NSIndexPath *)indexPath delegate:(id<ImageFiltrationDelegate>)theDelegate;

@end

@protocol ImageFiltrationDelegate <NSObject>
- (void)imageFiltrationDidFinish:(ImageFiltration *)filtration;
@end

