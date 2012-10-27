//
//  DAViewController.m
//  UIViewExample
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import "DAViewController.h"

@implementation DAViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    
    
    // dimensioni iphone: 320 * 480
    CGRect firstRect = CGRectMake(10.0, 10.0, 300.0, 440.0);
    UIView *firstView = [[UIView alloc] initWithFrame:firstRect];
    firstView.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    [self.view addSubview:firstView];
    
    CGRect secondRect = CGRectMake(10.0, 10.0, 280.0, 420.0);
    UIView *secondView = [[UIView alloc] initWithFrame:secondRect];
    secondView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    [firstView addSubview:secondView];
    
    CGRect labelsRect = CGRectMake(10.0, 10.0, 260.0, 400.0);
    UIView *labelsView = [[UIView alloc] initWithFrame:labelsRect];
    labelsView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    [secondView addSubview:labelsView];

    

    
    UILabel *nameLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 240.0, 40.0)];
    nameLabel1.text = @"Debo";
    nameLabel1.tag = 10;
    
    UILabel *nameLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 50.0, 240.0, 40.0)];
    nameLabel2.text = @"Wolf";
    nameLabel2.tag = 10;
    
    UILabel *nameLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 90.0, 240.0, 40.0)];
    nameLabel3.text = @"Zeff";
    nameLabel3.tag = 10;
    
    [labelsView addSubview:nameLabel1];
    [labelsView addSubview:nameLabel2];
    [labelsView addSubview:nameLabel3];
    
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    likeButton.frame = CGRectMake(10.0, 140.0, 240.0, 40.0);
    [likeButton setTitle:@"Eliminali dalla mia vista!" forState:UIControlStateNormal];
    [likeButton setTitle:@"Grazie!" forState:UIControlStateHighlighted];
    [likeButton addTarget:self action:@selector(clearButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    

    [labelsView addSubview:likeButton];
    
}

- (void) removeViewInView:(UIView*)view withTag:(NSInteger)tag
{
    for (UIView *childView in view.subviews) {
        [self removeViewInView:childView withTag:tag];
    }
    if (view.tag == tag) {
        [view removeFromSuperview];
    }
}

- (void)clearButtonTapped:(id)sender
{
    [self removeViewInView:self.view withTag:10];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
