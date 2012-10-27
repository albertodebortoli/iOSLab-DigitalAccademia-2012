//
//  DAMenuViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import "DAMenuViewController.h"
#import "NSObject+Model.h"

@implementation DAMenuViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //NSLog(@"Hi, I'm the menu and my pizza are: %@", [self sharedModel].menu.pizzas);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
