//
//  DAPresentedViewController.m
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DAPresentedViewController.h"

@implementation DAPresentedViewController

@synthesize dismissButton;

- (IBAction)dismissButtonPress:(id)sender
{
    // useful only in case the controller was presented into a modal view controller.
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"View loaded");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"View did disappear");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.dismissButton = nil;
    NSLog(@"View did unload");
}

@end
