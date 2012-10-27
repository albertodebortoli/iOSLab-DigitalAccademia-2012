//
//  DACounterViewController.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 12/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAModel.h"

@interface DACounterViewController : UIViewController {
    
    UILabel *_balanceLabel;
    UIStepper *_stepper;
    DAModel *_model;
}

@property (nonatomic, strong) DAModel *model;
@property (nonatomic, strong) IBOutlet UILabel *balanceLabel;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;

- (IBAction)stepperValueChanged:(id)sender;
- (IBAction)thrashButtonTapped:(id)sender;

@end
