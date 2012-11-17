//
//  DANumberViewController.h
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DANumberDetailViewController : UIViewController {
    
    UILabel *numberValueLabel;
    UILabel *numberCharacterLabel;
    NSNumber *numberValue;
    NSString *numberCharacter;
}

- (id)initWithNumber:(NSNumber *)number character:(NSString *)character;

@property (nonatomic, retain) IBOutlet UILabel *numberLabel;
@property (nonatomic, retain) IBOutlet UILabel *numberCharacterLabel;
@property (nonatomic, copy) NSNumber *numberValue;
@property (nonatomic, copy) NSString *numberCharacter;

@end
