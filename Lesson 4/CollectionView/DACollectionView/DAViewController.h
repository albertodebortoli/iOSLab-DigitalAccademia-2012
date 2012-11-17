//
//  DAViewController.h
//  DACollectionView
//
//  Created by Alessandro Benvenuti on 14/11/12.
//  Copyright (c) 2012 Alessandro Benvenuti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAViewController : UIViewController <
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
