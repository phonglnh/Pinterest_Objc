//
//  Photo.h
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, retain) UIImage *image;

- (id)init:(NSString *)caption comment:(NSString *)comment image:(UIImage *)image;
- (id)initWithDictionary:(NSDictionary *)dictionnary;

+ (NSMutableArray *) allPhotos ;
- (CGFloat) heightForComment: (UIFont *)font width:(CGFloat)width;

@end
