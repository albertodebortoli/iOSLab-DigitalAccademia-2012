//
//  DAViewController.h
//  ObjC-Delegation
//
//  Created by Alberto De Bortoli on 7/4/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    
    NSArray *persons;
}

@end
