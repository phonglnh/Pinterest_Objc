//
//  PinterestLayoutAttributes.m
//  Pinterest_Objc
//
//  Created by PhongLe on 7/19/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import "PinterestLayoutAttributes.h"

@implementation PinterestLayoutAttributes

- (id)copyWithZone:(NSZone *)zone {
    PinterestLayoutAttributes *copy = [super copyWithZone:zone];
    copy.photoHeight = self.photoHeight;
    return copy;
}

- (BOOL)isEqual:(id)object {
    PinterestLayoutAttributes *attributes = object;
    if (attributes.photoHeight == self.photoHeight){
        return [super isEqual:object];
    }
    return false;
}

@end
