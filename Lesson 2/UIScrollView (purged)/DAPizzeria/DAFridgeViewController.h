//
//  DAViewController.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 05/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAModel.h"

@interface DAFridgeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    DAModel *_model;
    UITableView *_tableView;
}

@property (nonatomic, strong) DAModel *model;
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@end
