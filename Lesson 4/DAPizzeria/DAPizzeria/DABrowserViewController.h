//
//  DABrowserViewController.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 14/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DABrowserViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *_webView;
    NSURLRequest *_urlRequest;
    
    UIBarButtonItem *_titleButton;
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_homeButton;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet NSURLRequest *urlRequest;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *titleButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *homeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil urlRequest:(NSURLRequest *)urlRequest;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)homeButtonTapped:(id)sender;


@end
