//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "CALayer+NewCategory.h"


@implementation CALayer (NewCategory)

- (void)dateMaths_glowWithColor:(UIColor *)color
{
    self.shadowColor = [color CGColor];
    self.shadowRadius = 2.0f;
    self.shadowOpacity = 0.6f;
    self.shadowOffset = CGSizeMake(0.0f, 8.0f);

    self.masksToBounds = NO;
}

- (void)dateMaths_borderWithColor:(UIColor *)color
{
    self.cornerRadius = 6.0f;
    self.borderWidth = 3.0f;
    self.borderColor = color.CGColor;
}

@end
