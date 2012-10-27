//
//  DAWebBrowserViewController.m
//  Cocoa-WebBrowser
//
//  Created by iOSLab on 7/11/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DAWebBrowserViewController.h"

@implementation DAWebBrowserViewController

#pragma mark - View lifecycle

//- (id)initWithURL:(NSURL *)aUrlAddress delegate:(id <DAWebBrowserViewControllerDelegate>)aDelegate
//{
//    self = [super initWithNibName:@"DAWebBrowserViewController_iPad" bundle:nil];
//        
//    if (self) {
//        // to do
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


@end
