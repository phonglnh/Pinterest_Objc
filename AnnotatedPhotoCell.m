//
//  AnnotatedPhotoCell.m
//  Pinterest_Objc
//
//  Created by PhongLe on 6/28/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "AnnotatedPhotoCell.h"
#import "PinterestLayoutAttributes.h"

@implementation AnnotatedPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setPhoto:(Photo *)photo {
    if (photo){
        _imageView.image = photo.image;
        _captionLabel.text = photo.caption;
        _commentLabel.text = photo.comment;
    }
}

-(void)applyLayoutAttributes:(PinterestLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.imageViewHeightLayoutConstraint.constant = layoutAttributes.photoHeight;
}

@end
