//
//  DAPerson.m
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import "DAPerson.h"

@implementation DAPerson

@synthesize name = _name;
@synthesize birthDate = _birthDate;
@synthesize sex = _sex;

- (id)initWithName:(NSString *)aName birthDate:(NSDate *)aDate sex:(DASex)aSex
{
    self = [super init];
    
    if (self != nil) {
        _name = aName;
        _birthDate = aDate;
        _sex = aSex;
    }
    
    return self;
}

- (NSString *)cardInfo
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY HH:mm:ss"];
    NSString *formattedDate = [formatter stringFromDate:self.birthDate];
    
    NSString *convertedSex = nil;
    
    switch (self.sex) {
        case kDASexMale:
            convertedSex = @"male";
            break;
        case kDASexFemale:
            convertedSex = @"female";
            break;
            
        default:
            convertedSex = @"unknown";
            break;
    }
    
    return [NSString stringWithFormat:@"My name is %@, I'm born on %@, I'm a %@ and my RAM memory address is %p", self.name, formattedDate, convertedSex, self];
}

@end
