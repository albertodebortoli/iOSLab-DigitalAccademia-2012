//
//  ViewController.h//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> 
{
    UIImageView                 *imageView;
    UIButton                    *openGallery;
    UIButton                    *takePhoto;
    UIImagePickerController     *picker;
    UIPopoverController         *popover;
}

@property (nonatomic, strong) IBOutlet  UIImageView             *imageView;
@property (nonatomic, strong) IBOutlet  UIButton                *openGallery;
@property (nonatomic, strong) IBOutlet  UIButton                *takePhoto;
@property (nonatomic, strong)           UIImagePickerController *picker;
@property (nonatomic, strong)           UIPopoverController     *popover;

- (IBAction)openGallery:(id)sender;
- (IBAction)takePhoto:(id)sender;

@end