//
//  DAViewController.h
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DANumberListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
