//
//  ImageFiltration.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/22/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//


#import "ImageFiltration.h"

@interface ImageFiltration ()
@property (nonatomic, readwrite, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readwrite, strong) PhotoRecord *photoRecord;
@end

@implementation ImageFiltration

#pragma mark - LifeCycle

- (id)initWithPhotoRecord:(PhotoRecord *)record atIndexPath:(NSIndexPath *)indexPath delegate:(id<ImageFiltrationDelegate>)theDelegate {
    if(self = [super init]) {
        [self setPhotoRecord:record];
        [self setIndexPathInTableView:indexPath];
        [self setDelegate:theDelegate];
    }
    return self;
}

#pragma mark - Main Operation
- (void)main {
    @autoreleasepool {
        if([self isCancelled]) return;
        
        if ([[self photoRecord] hasImage]) {
            return;
        }
        
        UIImage *rawImage = [[self photoRecord] image];
        UIImage *processedImage = [self applySepiaFilterToImage:rawImage];
        
        if ([self isCancelled]) {
            return;
        }
        
        if (processedImage) {
            [[self photoRecord] setImage:processedImage];
            [[self photoRecord] setFiltered:YES];
            [(id)[self delegate] performSelectorOnMainThread:@selector(imageFiltrationDidFinish:)
                                                  withObject:self
                                               waitUntilDone:NO];
        }
    }
}

#pragma mark - Filtering image
- (UIImage *)applySepiaFilterToImage:(UIImage *)image {
    
    //this is expensive and time consuming
    CIImage *inputImage = [CIImage imageWithData:UIImagePNGRepresentation(image)];
    
    if ([self isCancelled]) return nil;
    
    UIImage *sepiaImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues:kCIInputImageKey, inputImage,
                        @"inputIntensity", @(0.8), nil];
    CIImage *outputImage = [filter outputImage];
    
    if ([self isCancelled]) return nil;
    
    //create a CGIimage ref from the context
    //this is an expensive and time consuimg process
    CGImageRef outputImageRef = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    if ([self isCancelled]) {
        CGImageRelease(outputImageRef);
        return nil;
    }
    
    sepiaImage = [UIImage imageWithCGImage:outputImageRef];
    CGImageRelease(outputImageRef);
    return sepiaImage;
}

@end
