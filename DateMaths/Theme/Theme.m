//
//  Theme.m
//  DateMaths
//
//  Created by James Dunwoody on 30/05/2015.
//
//

#import "Theme.h"
#import "UIColor+NewCategory.h"

@implementation Theme

+ (UIColor *)colourMain
{
    return [UIColor dateMaths_neonPurple];
}

+ (UIFont *)fontWithSize:(int)fontSize
{
    return [UIFont fontWithName:@"NEON GLOW" size:fontSize];
}

+ (UIColor *)colourBackgroundGradientTop
{
    return [UIColor colorWithRed:(CGFloat)(42.0 / 255.0) green:(CGFloat)(93.0 / 255.0) blue:(CGFloat)(124.0 / 255.0) alpha:1.0];
}

+ (UIColor *)colourBackgroundGradientBottom
{
    return [UIColor colorWithRed:(CGFloat)(45.0 / 255.0) green:(CGFloat)(74.0 / 255.0) blue:(CGFloat)(93.0 / 255.0) alpha:1.0];
}

+ (UIColor *)datedatePickerTextColor
{
    return [UIColor dateMaths_neonPurple];
}

+ (UIColor *)deselectedColour
{
    return [UIColor darkGrayColor];
}
@end
