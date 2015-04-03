//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "CALayer+NewCategory.h"


@implementation CALayer (NewCategory)

- (void)addBlackBorder
{
    self.borderColor = [UIColor blackColor].CGColor;
    self.borderWidth = 1.0f;
}

@end
