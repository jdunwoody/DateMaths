//
//  GraduatedGradientLayer.m
//  DateMaths
//
//  Created by James Dunwoody on 30/05/2015.
//
//

#import "GraduatedGradientLayer.h"
#import "Theme.h"

@implementation GraduatedGradientLayer

+ (CAGradientLayer *)layer
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.colors = @[
        (id)[Theme colourBackgroundGradientTop].CGColor,
        (id)[Theme colourBackgroundGradientBottom].CGColor,
    ];
    gradientLayer.locations = @[@0, @1];

    return gradientLayer;
}

@end
