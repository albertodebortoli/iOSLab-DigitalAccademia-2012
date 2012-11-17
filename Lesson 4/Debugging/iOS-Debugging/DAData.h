//
//  DAData.h
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 25/09/10.
//  Copyright 2010 iHarmony, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAData : NSObject {
    
    NSDictionary *db;
}

#pragma mark - class methods

+ (DAData *)sharedInstance;
- (NSArray *)numbers;

@end
