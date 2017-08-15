//
//  RoundedCornersView.m
//  Pinterest_Objc
//
//  Created by PhongLe on 6/28/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "RoundedCornersView.h"

@implementation RoundedCornersView

- (void)drawRect:(CGRect)rect {
    
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.masksToBounds = self.cornerRadius > 0;
    
}

@end
