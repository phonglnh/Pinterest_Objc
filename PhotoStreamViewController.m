//
//  PhotoStreamViewController.m
//  Pinterest_Objc
//
//  Created by PhongLe on 6/28/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "PhotoStreamViewController.h"
#import "AnnotatedPhotoCell.h"
#import "Photo.h"
#import <AVFoundation/AVFoundation.h>

#define cellId "AnnotatedPhotoCell"

@interface PhotoStreamViewController ()

@property (nonatomic, strong) NSArray *arrPhotos;

@end

@implementation PhotoStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrPhotos = [Photo allPhotos];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Pattern"]];
    
    PinterestLayout *layout = [[PinterestLayout alloc] init];
    layout.delegate = self;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(23, 5, 10, 5);
    
    UINib *nibCell = [UINib nibWithNibName:@cellId bundle:nil];
    
    [self.collectionView registerNib:nibCell forCellWithReuseIdentifier:@cellId];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_arrPhotos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AnnotatedPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@cellId forIndexPath:indexPath];
    Photo *photo = [_arrPhotos objectAtIndex:indexPath.item];
    cell.photo = photo;

    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width {
    Photo *photo = [self.arrPhotos objectAtIndex:indexPath.item];
    CGRect boundingRect = CGRectMake(0, 0, width, CGFLOAT_MAX);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect(photo.image.size, boundingRect);
    return rect.size.height;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width {
    CGFloat annotationPadding = 4;
    CGFloat annotationHeaderHeight = 17;
    Photo *photo = [self.arrPhotos objectAtIndex:indexPath.item];
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Regular" size:10];
    CGFloat commentHeight = [photo heightForComment:font width:width];
    CGFloat height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding;
    return height;
}

@end
