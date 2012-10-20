//
//  DAPresentedViewController.h
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAPresentedViewController : UIViewController

- (IBAction)dismissButtonPress:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton *dismissButton;

@end
