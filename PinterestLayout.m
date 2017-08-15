//
//  PinterestLayout.m
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "PinterestLayout.h"
#import "PinterestLayoutAttributes.h"

@interface PinterestLayout()

@property (nonatomic,strong) NSMutableArray *cache;
@property (nonatomic,assign) CGFloat contentHeight;
@property (nonatomic,assign) CGFloat contentWidth;

@end

@implementation PinterestLayout

- (CGFloat)contentWidth {
    UIEdgeInsets insets = self.collectionView.contentInset;
    return CGRectGetWidth(self.collectionView.bounds) - (insets.left + insets.right);
}

+ (Class)layoutAttributesClass {
    return PinterestLayoutAttributes.self;
}

- (NSMutableArray *)cache {
    if (!_cache) {
        _cache = [[NSMutableArray alloc] init];
    }
    return _cache;
}

- (NSInteger)numberOfColumns {
    return 2;
}

- (CGFloat)cellPadding {
    return 6;
}

- (void)invalidateLayout {
    [_cache removeAllObjects];
    [super invalidateLayout];
}

- (void)prepareLayout {
    if (self.cache.count == 0) {
        CGFloat columnWidth = self.contentWidth / (CGFloat)self.numberOfColumns;
        NSMutableArray *xOffset = [[NSMutableArray alloc] init];
        NSMutableArray *yOffset = [[NSMutableArray alloc] init];
        for (NSInteger column = 0; column < self.numberOfColumns; column++) {
            NSNumber *numberX = [NSNumber numberWithFloat:(CGFloat)column * columnWidth];
            [xOffset addObject: numberX];
            [yOffset addObject:[NSNumber numberWithFloat:0]];
        }
        NSInteger column = 0;
        
        for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:0]; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            CGFloat width = columnWidth - self.cellPadding*2;
            CGFloat photoHeight = [self.delegate collectionView:self.collectionView heightForPhotoAtIndexPath:indexPath withWidth:width];
            CGFloat annotationHeight = [self.delegate collectionView:self.collectionView heightForAnnotationAtIndexPath:indexPath withWidth:width];
            CGFloat height = self.cellPadding + photoHeight + annotationHeight + self.cellPadding;
            
            CGRect frame = CGRectMake([[xOffset objectAtIndex:column] floatValue] , [[yOffset objectAtIndex:column] floatValue], columnWidth, height);
            CGRect insetFrame = CGRectInset(frame, self.cellPadding, self.cellPadding);
            
            PinterestLayoutAttributes *attributes = [PinterestLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.photoHeight = photoHeight;
            attributes.frame = insetFrame;
              
            [self.cache addObject:attributes];
            
            self.contentHeight = MAX(self.contentHeight, CGRectGetMaxY(frame));
            [yOffset replaceObjectAtIndex:column withObject:[NSNumber numberWithFloat:([[yOffset objectAtIndex:column] floatValue] + height)]];
            column = column >= (self.numberOfColumns - 1) ? 0 : ++column;
        }
    }
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.contentWidth, self.contentHeight);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    for (UICollectionViewLayoutAttributes *attributes in self.cache) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [layoutAttributes addObject:attributes];
        }
    }
    return layoutAttributes;
}

@end
