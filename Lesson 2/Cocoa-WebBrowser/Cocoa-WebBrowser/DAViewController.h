//
//  DAViewController.h
//  Cocoa-WebBrowser
//
//  Created by iOSLab on 7/11/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAWebBrowserViewController.h"

// DAViewController objects are the delegates for DAWebBrowseViewController objects
// they conform the DAWebBrowserViewControllerDelegate protocol

@interface DAViewController : UIViewController <DAWebBrowserViewControllerDelegate, UIAlertViewDelegate> {
    
    NSMutableArray *history;
    IBOutlet UITextView *historyTextArea;
}

- (IBAction)launchWebBrowser:(id)sender;

@end
