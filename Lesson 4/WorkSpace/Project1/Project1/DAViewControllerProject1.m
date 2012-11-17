//
//  DAViewControllerProject1.m
//  Project1
//
//  Created by iOSLab on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAViewControllerProject1.h"

@interface DAViewControllerProject1 ()

@end

@implementation DAViewControllerProject1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    label.center = self.view.center;
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    label.numberOfLines = 5;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Shared ViewController\npushed into project 2";
    [self.view addSubview:label];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
