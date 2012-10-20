//
//  DAPerson.h
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kDASexUnknown   = 0,
    kDASexMale      = 1,
    kDASexFemale    = 2
} DASex;

@interface DAPerson : NSObject <NSCopying> {
    
    NSString        *_name;
    NSDate          *_birthDate;
    DASex           _sex;
}

- (id)initWithName:(NSString *)aName birthDate:(NSDate *)aDate sex:(DASex)aSex;
- (NSString *)cardInfo;
- (id)copyWithZone:(NSZone *)zone;

+ (DAPerson *)createAPerson;

@property (nonatomic, copy)     NSString  *name;
@property (nonatomic, copy)     NSDate    *birthDate;
@property (nonatomic, assign)   DASex   sex;

@end
