//
//  UIImage+UIImage_Decompression.m
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "UIImage+UIImage_Decompression.h"

@implementation UIImage (UIImage_Decompression)

+ (UIImage *)initDecompressedImage:(NSString *)photo {
    UIImage *image = [UIImage imageNamed:photo];
    UIGraphicsBeginImageContextWithOptions(image.size, true, 0);
    [image drawAtPoint:CGPointZero];
    UIImage *decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return decompressedImage;
}

@end

