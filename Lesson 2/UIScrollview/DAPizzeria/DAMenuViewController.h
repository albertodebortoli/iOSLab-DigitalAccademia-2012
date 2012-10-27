//
//  DAMenuViewController.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAMenuViewController : UIViewController {
    UIScrollView *_scrollView;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@end
