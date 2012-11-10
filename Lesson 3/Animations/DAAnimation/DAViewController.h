//
//  DAViewController.h
//  DAAnimation
//
//  Created by Alessandro Benvenuti on 07/11/12.
//  Copyright (c) 2012 Alessandro Benvenuti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong)   IBOutlet    UITableView *animationTableView;
@property (nonatomic, strong)   IBOutlet    UIImageView *imageView;

@end
