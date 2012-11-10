//
//  DAViewController.m
//  DAAnimation
//
//  Created by Alessandro Benvenuti on 07/11/12.
//  Copyright (c) 2012 Alessandro Benvenuti. All rights reserved.
//

#import "DAViewController.h"

typedef enum {
    DAAnimationTypeFade         = 0,
    DAAnimationTypeRotate       = 1,
    DAAnimationTypeHorizontal   = 2,
    DAAnimationTypeAll          = 3,
} DAAnimationType;

@interface DAViewController ()
@property (nonatomic, strong)   NSArray     *animations;

- (void)fadeAnimation;
- (void)rotateAnimation;
- (void)horizontalAnimation;
- (void)allAnimations;

@end

@implementation DAViewController

#pragma mark Lifecicle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animations = @[[NSNumber numberWithInt:DAAnimationTypeFade], [NSNumber numberWithInt:DAAnimationTypeRotate], [NSNumber numberWithInt:DAAnimationTypeHorizontal], [NSNumber numberWithInt:DAAnimationTypeAll]];
    [self.animationTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate/UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    DAAnimationType animationType = [[self.animations objectAtIndex:indexPath.row] intValue];
    
    switch (animationType) {
        case DAAnimationTypeFade:
            cell.textLabel.text = @"Fade";
            break;
        case DAAnimationTypeRotate:
            cell.textLabel.text = @"Rotate";
            break;
        case DAAnimationTypeHorizontal:
            cell.textLabel.text = @"Horizontal";
            break;
        case DAAnimationTypeAll:
            cell.textLabel.text = @"All";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAAnimationType animationType = [[self.animations objectAtIndex:indexPath.row] intValue];
    
    switch (animationType) {
        case DAAnimationTypeFade:
            [self fadeAnimation];
            break;
        case DAAnimationTypeRotate:
            [self rotateAnimation];
            break;
        case DAAnimationTypeHorizontal:
            [self horizontalAnimation];
            break;
        case DAAnimationTypeAll:
            [self allAnimations];
            break;
            
        default:
            break;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animations count];
}

#pragma mark - Animation

- (void)fadeAnimation
{
    [UIView animateWithDuration:1.5
                          delay: 0.0
                        options:UIViewAnimationCurveEaseOut
     
                    animations:^{
                        self.imageView.alpha = 0.5;
                    }
     
     
                    completion:^(BOOL finished){
                        [UIView animateWithDuration:1.5
                                         animations:^{
                                             self.imageView.alpha = 1.0;
                                         }];
                    }];
}

- (void)rotateAnimation
{
    [UIView animateWithDuration:1.5
                          delay: 0.0
                        options:UIViewAnimationCurveEaseIn
     
                     animations:^{
                         self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
                     }
     
     
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.5
                                          animations:^{
                                              self.imageView.transform = CGAffineTransformMakeRotation(0);
                                          }];
                     }];
    
}

- (void)horizontalAnimation
{   
    [UIView beginAnimations:@"horizontal" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDuration:1.5];
    self.imageView.frame = CGRectMake(-100,
                                      self.imageView.frame.origin.y,
                                      self.imageView.frame.size.width,
                                      self.imageView.frame.size.height);
    [UIView commitAnimations];
    
    
//    float originalX = self.imageView.frame.origin.x;
//    [UIView animateWithDuration:1.5
//                          delay: 0.0
//                        options:UIViewAnimationCurveEaseIn
//     
//                     animations:^{
//                         self.imageView.frame = CGRectMake(-100,
//                                                           self.imageView.frame.origin.y,
//                                                           self.imageView.frame.size.width,
//                                                           self.imageView.frame.size.height);
//                     }
//     
//     
//                     completion:^(BOOL finished){
//                         [UIView animateWithDuration:1.5
//                                          animations:^{
//                                              self.imageView.frame = CGRectMake(originalX,
//                                                                                self.imageView.frame.origin.y,
//                                                                                self.imageView.frame.size.width,
//                                                                                self.imageView.frame.size.height);
//                                          }];
//                     }];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    NSLog(@"Finished animation with id:%@", animationID);
    [UIView beginAnimations:@"horizontal" context:nil];
    [UIView setAnimationDuration:1.5];
    self.imageView.frame = CGRectMake(45,
                                      self.imageView.frame.origin.y,
                                      self.imageView.frame.size.width,
                                      self.imageView.frame.size.height);
    [UIView commitAnimations];
    
}


- (void)allAnimations
{
    float originalX = self.imageView.frame.origin.x;
    [UIView animateWithDuration:1.5
                          delay: 0.0
                        options:UIViewAnimationCurveEaseIn
     
                     animations:^{
                         self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
                         self.imageView.alpha = 0.5;
                         self.imageView.frame = CGRectMake(-100,
                                                           self.imageView.frame.origin.y,
                                                           self.imageView.frame.size.width,
                                                           self.imageView.frame.size.height);
                     }
     
     
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.5
                                          animations:^{
                                              self.imageView.alpha = 1.0;
                                              self.imageView.transform = CGAffineTransformMakeRotation(0);
                                              self.imageView.frame = CGRectMake(originalX,
                                                                                self.imageView.frame.origin.y,
                                                                                self.imageView.frame.size.width,
                                                                                self.imageView.frame.size.height);
                                          }];
                     }];
}

@end
