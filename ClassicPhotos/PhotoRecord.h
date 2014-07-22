//
//  PhotoRecord.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoRecord : NSObject

@property (nonatomic, strong) NSString *name; // to store the name of the image
@property (nonatomic, strong) UIImage *image; // to store the actual image
@property (nonatomic, strong) NSURL *url; //to store the URL of the image
@property (nonatomic, readonly) BOOL hasImage; //return YES if image is downloaded
@property (nonatomic, getter = isFiltered) BOOL filtered; //return YES if the image is sephia filtered
@property (nonatomic, getter = isFailed) BOOL failed; //return YES if image failed to be downloaded

@end
