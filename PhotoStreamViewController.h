//
//  PhotoStreamViewController.h
//  Pinterest_Objc
//
//  Created by PhongLe on 6/28/17.
//  Copyright © 2017 PhongLNH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinterestLayout.h"

@interface PhotoStreamViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,PinterestLayoutDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
