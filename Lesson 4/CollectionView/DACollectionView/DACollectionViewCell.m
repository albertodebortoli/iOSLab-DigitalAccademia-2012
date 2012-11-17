//
//  DACollectionViewCell.m
//  DACollectionView
//
//  Created by Alessandro Benvenuti on 15/11/12.
//  Copyright (c) 2012 Alessandro Benvenuti. All rights reserved.
//

#import "DACollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation DACollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 35.0;
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor underPageBackgroundColor];
    }
    return self;
}

@end
