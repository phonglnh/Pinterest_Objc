//
//  Photo.m
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "Photo.h"
#import "UIImage+UIImage_Decompression.h"

@implementation Photo

- (id)init:(NSString *)caption comment:(NSString *)comment image:(UIImage *)image {
    if (self = [super init]) {
        self.caption = caption;
        self.comment = comment;
        self.image = image;
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dictionnary {
    NSString *caption = dictionnary[@"Caption"];
    NSString *comment = dictionnary[@"Comment"];
    NSString *photo = dictionnary[@"Photo"];
    UIImage *image = [UIImage initDecompressedImage:photo];
    
    return [self init:caption comment:comment image:image];
}

+(NSMutableArray *)allPhotos {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"];
    NSArray *arrPhotosPlist = [NSArray arrayWithContentsOfURL:url];
    for (NSDictionary *dictionary in arrPhotosPlist){
        Photo *photo = [[self alloc] initWithDictionary:dictionary];
        [arr addObject:photo];
    }
    return arr;
}

- (CGFloat)heightForComment:(UIFont *)font width:(CGFloat)width {
    CGRect rect = [[NSString stringWithString:self.comment] boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    return ceilf(rect.size.height);
}

@end
