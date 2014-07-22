//
//  ListViewController.m
//  ClassicPhotos
//
//  Created by Derrick Ho on 7/21/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

#pragma mark - lazy instantiation

- (NSDictionary *)photos {
    if(_photos == nil) {
        NSURL *dataSourceURL = [NSURL URLWithString:kDatasourceURLString];
        _photos = [NSDictionary dictionaryWithContentsOfURL:dataSourceURL];
    }
    return _photos;
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    self.title = @"Classic Photos";
    self.tableView.rowHeight = 80;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.photos.count;
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"Cell Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *rowKey = self.photos.allKeys[indexPath.row];
    NSURL *imageURL = [NSURL URLWithString:self.photos[rowKey]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image;
    
    if (imageData) {
        UIImage *unfiltered_image = [UIImage imageWithData:imageData];
        image = [self applySepiaFilterToImage:unfiltered_image];
    }
    
    cell.textLabel.text = rowKey;
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark - image filtration

- (UIImage *)applySepiaFilterToImage:(UIImage *)image {
    CIImage *inputImage = [CIImage imageWithData:UIImagePNGRepresentation(image)];
    UIImage *sepiaImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey, inputImage, @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    
    CIImage *outputImage = [filter outputImage];
    CGImageRef outputImageRef = [context createCGImage:outputImage fromRect:[outputImage extent]];
    sepiaImage = [UIImage imageWithCGImage:outputImageRef];
    CGImageRelease(outputImageRef);
    return sepiaImage;
}

@end



















