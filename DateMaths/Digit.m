//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Digit.h"


@interface Digit ()
@end

@implementation Digit
- (instancetype)initWithDigit:(double)digit
{
    self = [super init];
    if (!self) {
        return self;
    }

    _digit = digit;

    return self;
}
@end
