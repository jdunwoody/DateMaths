//
//  UIViewController+jamesGradientBackground.m
//  DateMaths
//
//  Created by James Dunwoody on 30/05/2015.
//
//

#import "UIViewController+jamesGradientBackground.h"
#import "GraduatedGradientLayer.h"

@implementation UIViewController (jamesGradientBackground)

- (void)dateMaths_gradientBackgroundWhiteToGray
{
    CALayer *gradientColorLayer = [GraduatedGradientLayer layer];
    gradientColorLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradientColorLayer atIndex:0];
}

- (void)dateMaths_hideNavigationController
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)dateMaths_showNavigationController
{
    self.navigationController.navigationBarHidden = NO;
}

@end
