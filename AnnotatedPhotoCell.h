//
//  AnnotatedPhotoCell.h
//  Pinterest_Objc
//
//  Created by PhongLe on 6/28/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface AnnotatedPhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (nonatomic, strong) Photo *photo;
-(void) setPhoto:(Photo *)photo;

@end
