//
//  DAViewController.m
//  Cocoa-WebBrowser
//
//  Created by iOSLab on 7/11/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DAViewController.h"

@implementation DAViewController

#pragma mark - Actions

- (IBAction)launchWebBrowser:(id)sender
{
    DAWebBrowserViewController *webBrowserViewController = [[DAWebBrowserViewController alloc] initWithURL:[NSURL URLWithString:@"http://google.com"] delegate:self];
    [self presentModalViewController:webBrowserViewController animated:YES];
}

#pragma mark - DAWebBrowserViewControllerDelegate

- (void)webBrowserViewControllerDidDismiss:(DAWebBrowserViewController *)controller
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Web Browser closed"
                                                    message:@"Hope you enjoyed the web surfing!"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Log history", nil];
    [alert show];
}

- (void)webBrowserViewController:(DAWebBrowserViewController *)controller didRequestURL:(NSURL *)url
{
    if (!history) {
        history = [[NSMutableArray alloc] init];
    }
    
    [history addObject:url];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *historyText = @"";
        
        for (NSURL *url in history) {
            historyText = [historyText stringByAppendingFormat:@"\n%@", [url absoluteString]];
        }
        
        historyTextArea.text = historyText;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
