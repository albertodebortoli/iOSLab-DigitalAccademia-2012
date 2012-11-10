//
//  GesturesViewController.h
//  Gestures

#import <UIKit/UIKit.h>

@interface GesturesViewController : UIViewController <UIGestureRecognizerDelegate> {
    UILabel         *console;
    UIView          *touchView;
    UIButton        *clearConsoleButton;
    UIImageView     *imageView;
    
    CGFloat         savedRotation;
}

@property (nonatomic, strong) IBOutlet  UILabel     *console;
@property (nonatomic, strong) UIView                *touchView;
@property (nonatomic, strong) IBOutlet  UIButton    *clearConsoleButton;
@property (nonatomic, strong) IBOutlet  UIImageView *imageView;
@property (nonatomic, assign)           CGFloat     savedRotation;

- (IBAction)clearConsole:(id)sender;

@end
