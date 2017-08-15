//
//  PinterestLayout.h
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestLayoutDelegate <NSObject>

-(CGFloat) collectionView: (UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width;

-(CGFloat) collectionView: (UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width;

@end

@interface PinterestLayout : UICollectionViewLayout

@property (nonatomic,weak) id<PinterestLayoutDelegate> delegate;
@property (nonatomic,assign) NSInteger numberOfColumns;
@property (nonatomic,assign) CGFloat cellPadding;

@end
