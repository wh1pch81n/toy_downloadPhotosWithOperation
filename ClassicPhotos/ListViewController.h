//
//  ListViewController.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma  mark - 1
/**
 You can delete the importation of core image since that work has been moved.
 However, you still ned to import PhotoRecord, PendingOperations, ImageDownloader, and ImageFiltration
 */
//#import <CoreImage/CoreImage.h> //Not needed here anymore since the NSOperation takes care of it
#import "PhotoRecord.h"
#import "PendingOperations.h"
#import "ImageDownloader.h"
#import "ImageFiltration.h"

#pragma mark - 2
//import the afnetworking
#import "AFNetworking.h"


#define kDatasourceURLStringOld @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"
#define kDatasourceURLString @"https://sites.google.com/site/soheilsstudio/tutorials/nsoperationsampleproject/ClassicPhotosDictionary.plist"

#pragma mark - 3
/**
 attach delegates
 */
@interface ListViewController : UITableViewController <ImageDownloaderDelegate, ImageFiltrationDelegate>

#pragma mark - 4
/**
 Instances of PhotoRecord
 */
@property (nonatomic, strong) NSMutableArray *photos; //main datasource of controller

#pragma mark - 5
/**
 Use this to track pending operations
 */
@property (nonatomic, strong) PendingOperations *pendingOperations;

@end
