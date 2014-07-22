//
//  ListViewController.h
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

#define kDatasourceURLString @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"

@interface ListViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *photos;// main datasource for our images

@end
