//
//  PendingOperations.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "PendingOperations.h"

@implementation PendingOperations

- (NSMutableDictionary *)downloadsInProgress {
    return _downloadsInProgress ?: (_downloadsInProgress = [NSMutableDictionary new]);
}

- (NSOperationQueue *)downloadQueue {
    if(!_downloadQueue) {
        _downloadQueue = [NSOperationQueue new];
        _downloadQueue.name = @"Download Queue";
        _downloadQueue.maxConcurrentOperationCount = 1;
    }
    return _downloadQueue;
}

- (NSMutableDictionary *)filtrationsInProgress {
    return _filtrationsInProgress ?: (_filtrationsInProgress = [NSMutableDictionary new]);
}

- (NSOperationQueue *)filtrationQueue {
    if(!_filtrationQueue) {
        _filtrationQueue = [NSOperationQueue new];
        _filtrationQueue.name = @"Image Filtration Queue";
        _filtrationQueue.maxConcurrentOperationCount = 1;
    }
    return _filtrationQueue;
}

@end
