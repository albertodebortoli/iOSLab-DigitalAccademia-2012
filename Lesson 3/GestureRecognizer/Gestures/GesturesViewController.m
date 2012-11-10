//
//  GesturesViewController.m
//  Gestures
//

#import "GesturesViewController.h"

@implementation GesturesViewController

@synthesize console;
@synthesize touchView;
@synthesize clearConsoleButton;
@synthesize imageView;
@synthesize savedRotation;

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect touchFrame = CGRectMake(0, 0, 320, 480);
    self.touchView = [[UIView alloc] initWithFrame:touchFrame];
    self.touchView.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:self.touchView belowSubview:self.imageView];
    
    self.console.text = @"";
    
    
    /*
     * Double-tap Definition
     */
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    [doubleTap setNumberOfTouchesRequired:1];
    [doubleTap setNumberOfTapsRequired:2];
    [touchView addGestureRecognizer:doubleTap];
    
    /*
     * Tap Definition
     */
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [tap setNumberOfTouchesRequired:1];
    [tap setNumberOfTapsRequired:1];
    [tap requireGestureRecognizerToFail:doubleTap];
    [touchView addGestureRecognizer:tap];
    
    /*
     * Two-finger Tap Definition
     */
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerTap)];
    [twoFingerTap setNumberOfTouchesRequired:2];
    [twoFingerTap setNumberOfTapsRequired:1];
    [touchView addGestureRecognizer:twoFingerTap];
    
    /*
     * Two-finger Double-tap Definition
     */
    UITapGestureRecognizer *twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap)];
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    [touchView addGestureRecognizer:twoFingerDoubleTap];
    
   /*
    * Swipe Up
    */
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [touchView addGestureRecognizer:swipeUp];
    
    /*
     * Swipe Down
     */
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [touchView addGestureRecognizer:swipeDown];
    
    /*
     * Swipe Left
     */
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [touchView addGestureRecognizer:swipeLeft];
    
    /*
     * Swipe Right
     */
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [touchView addGestureRecognizer:swipeRight];
    
    /*
     * Rotate
     */
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    rotate.delegate = self;
    [imageView addGestureRecognizer:rotate];
}

#pragma mark - Gesture Handling

- (void)tap 
{
    NSString *output = [NSString stringWithFormat:@"Action: Tap"];
    NSLog(@"%@", output);
    console.text = [NSString stringWithFormat:@"%@", output];
}

- (void)twoFingerTap 
{
    NSString *output = [NSString stringWithFormat:@"Action: Two-finger Tap"];
    NSLog(@"%@", output);
    console.text = [NSString stringWithFormat:@"%@", output];
}

- (void)doubleTap 
{
    NSString *output = [NSString stringWithFormat:@"Action: Double-tap"];
    NSLog(@"%@", output);
    console.text = [NSString stringWithFormat:@"%@", output];
}

- (void)twoFingerDoubleTap 
{
    NSString *output = [NSString stringWithFormat:@"Action: Two-finger Double-tap"];
    NSLog(@"%@", output); 
    console.text = [NSString stringWithFormat:@"%@", output];
}

- (void)swipeUp:(UISwipeGestureRecognizer *)recognizer 
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSString *output = [NSString stringWithFormat:@"Action: Swipe Up - %f, %f", point.x, point.y];
    NSLog(@"%@", output);
    console.text = output;
}

- (void)swipeDown:(UISwipeGestureRecognizer *)recognizer 
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSString *output = [NSString stringWithFormat:@"Action: Swipe Down - %f, %f", point.x, point.y];
    NSLog(@"%@", output);
    console.text = output;
}

- (void)swipeLeft:(UISwipeGestureRecognizer *)recognizer 
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSString *output = [NSString stringWithFormat:@"Action: Swipe Left - %f, %f", point.x, point.y];
    NSLog(@"%@", output);
    console.text = output;
}

- (void)swipeRight:(UISwipeGestureRecognizer *)recognizer 
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSString *output = [NSString stringWithFormat:@"Action: Swipe Right - %f, %f", point.x, point.y];
    NSLog(@"%@", output);
    console.text = output;
}

- (void)rotate:(UIRotationGestureRecognizer *)recognizer
{
    CGFloat rotation = recognizer.rotation;
    self.imageView.transform = CGAffineTransformMakeRotation(savedRotation + rotation);
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)recognizer
{
    self.savedRotation = atan2(self.imageView.transform.b, self.imageView.transform.a);
    return YES;
}

- (IBAction)clearConsole:(id)sender
{
    NSLog(@"Console cleared");
    console.text = @"";
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    self.console = nil;
    self.clearConsoleButton = nil;
}

- (void)dealloc
{
    self.touchView.gestureRecognizers = nil;
}

@end
