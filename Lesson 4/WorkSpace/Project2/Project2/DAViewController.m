//
//  DAViewController.m
//  Project2
//
//  Created by iOSLab on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAViewController.h"
#import "DAViewControllerProject1.h"

@interface DAViewController ()

@end

@implementation DAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DAViewControllerProject1 *cntrl = [[DAViewControllerProject1 alloc] initWithNibName:@"DAViewControllerProject1" bundle:nil];
    [self.navigationController pushViewController:cntrl animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
