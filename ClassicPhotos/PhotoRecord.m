//
//  PhotoRecord.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "PhotoRecord.h"

@implementation PhotoRecord

- (BOOL)hasImage { return _image != nil;}

- (BOOL)isFailed { return _failed;}

- (BOOL)isFiltered { return _filtered;}

@end
