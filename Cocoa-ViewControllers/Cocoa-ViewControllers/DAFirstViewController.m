//
//  DAViewController.m
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DAFirstViewController.h"

@implementation DAFirstViewController

- (IBAction)presentButtonPressed:(id)sender
{
    DAPresentedViewController *presentViewController = [[DAPresentedViewController alloc] initWithNibName:@"DAPresentedViewController" bundle:nil];
    [self.navigationController pushViewController:presentViewController animated:YES];
    [presentViewController release];
}

@end
