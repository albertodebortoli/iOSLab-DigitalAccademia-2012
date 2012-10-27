//
//  DAViewController.h
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAViewController : UIViewController {
    
    NSArray *maleNames;
    NSArray *femaleNames;
    IBOutlet UILabel *logLabel;
    IBOutlet UIButton *createMaleButton;
    IBOutlet UIButton *createFemaleButton;
}

- (IBAction)createAPersonAndLogit:(id)sender;

@end
