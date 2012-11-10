//
//  Counter.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DACounter.h"

#define kStartingBalance 100.0
#define kStartingBalanceKey @"kStartingBalanceKey" 


@implementation DACounter

@synthesize balance;

- (void)deposit:(CGFloat)amount 
{
    self.balance += amount;
}

- (CGFloat)withdraw:(CGFloat)amount 
{
    if (self.balance >= amount) {
        self.balance -= amount;
        return amount;
    }
    else {
        float res = self.balance;
        self.balance = 0.0;
        return res;
    }
}

- (CGFloat)balance 
{
    NSNumber *b = [[NSUserDefaults standardUserDefaults] objectForKey:kStartingBalanceKey];
    if (b) {
        return [b floatValue];
    }
    else {
        self.balance = kStartingBalance;
        return self.balance;
    }
}

- (void)setBalance:(CGFloat)aBalance 
{
    if (aBalance != [self balance]) {
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:[NSNumber numberWithFloat:aBalance] forKey:kStartingBalanceKey];
        [def synchronize];
    }
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"COUNTER - balance: %.2f euro", self.balance];
}

@end
