//
//  DABrowserViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 14/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DABrowserViewController.h"
#import "MBProgressHUD.h"

@implementation DABrowserViewController

@synthesize webView = _webView;
@synthesize urlRequest = _urlRequest;
@synthesize titleButton = _titleButton;
@synthesize backButton = _backButton;
@synthesize homeButton = _homeButton;


#define kMaxTitleChars 20

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setShortTitle:(NSString*)longTitle 
{
    self.titleButton.title = ([longTitle length] < kMaxTitleChars) ? longTitle : [[longTitle substringToIndex:kMaxTitleChars-1] stringByAppendingString:@"..."];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil urlRequest:(NSURLRequest *)urlRequest 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _urlRequest = urlRequest;
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.webView loadRequest:self.urlRequest];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    // se c'è solo un viewcontroller, siamo alla prima vista, quindi disabilito il bottone
    if ([self.navigationController.viewControllers count] == 1) {
        self.backButton.enabled = NO;
        self.homeButton.enabled = NO; 
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webView = nil;
    self.backButton = nil;
    self.titleButton = nil;
    self.homeButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [self setShortTitle:[self.webView stringByEvaluatingJavaScriptFromString:@"document.title"]];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error 
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    //[webView loadHTMLString:[NSString stringWithFormat:@"%@", error] baseURL:nil];
    [self setShortTitle:@"Error"];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    switch (navigationType) {
            
        // case 0: tap dell'utente, voglio evitare eventuali che i redirect siano interpretati come nuove richieste
        case 0: {
            DABrowserViewController *newBrowserController = [[DABrowserViewController alloc] initWithNibName:@"DABrowserViewController" bundle:nil urlRequest:request];
            [self.navigationController pushViewController:newBrowserController animated:YES];
            return NO;
            break;
        }
        default:
            break;
    }
    
    return YES;
}

#pragma mark - IBAction


- (IBAction)backButtonTapped:(id)sender
{
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)homeButtonTapped:(id)sender
{
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
