//
//  ResultsSliderViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 31/05/2015.
//
//

#import "ResultsSliderViewController.h"
#import "SlidingThing.h"
#import "CALayer+NewCategory.h"
#import "Theme.h"

@implementation ResultsSliderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _minYValue = 0;
    _maxYValue = 0;
    _targetYValue = 0;
    _actualYValue = 0;

    [self.actualLabel.layer dateMaths_borderWithColor:[Theme colourMain]];
    [self.targetLabel.layer dateMaths_borderWithColor:[Theme colourMain]];

    [self update];
}

- (void)setActualYValue:(int)actualYValue
{
    _actualYValue = MAX(actualYValue, self.minYValue);
    _actualYValue = MIN(_actualYValue, self.maxYValue);
    self.actualLabel.text = [NSString stringWithFormat:@"%d", actualYValue];

    self.maxYValue = self.actualYValue + 10;

    [self update];
}

- (void)setTargetYValue:(int)targetYValue
{
    _targetYValue = MAX(targetYValue, self.minYValue);
    _targetYValue = MIN(_targetYValue, self.maxYValue);
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetYValue];

    self.maxYValue = self.targetYValue + 10;

    [self update];
}

- (void)setMinYValue:(int)minYValue
{
    _minYValue = MAX(minYValue, 0);

    [self update];
}

- (void)setMaxYValue:(int)maxYValue
{
    _maxYValue = MAX(maxYValue, self.minYValue);

    [self update];
}

- (void)update
{
    CGFloat valueRange = self.maxYValue - self.minYValue;
    CGFloat actualValueRatio = self.actualYValue - self.minYValue;
    CGFloat targetValueRatio = self.targetYValue - self.minYValue;
    CGFloat frameRange = self.view.frame.size.height;

    CGFloat actualRange = actualValueRatio / valueRange;
    if (isnan(actualRange)) {
        actualRange = 0;
    }
    CGFloat actualYPosition = actualRange * frameRange + self.view.frame.origin.y;

    CGFloat targetRange = targetValueRatio / valueRange;
    if (isnan(targetRange)) {
        targetRange = 0;
    }
    CGFloat targetYPosition = targetRange * frameRange + self.view.frame.origin.y;

    self.slidingControl.actualYPosition = actualYPosition;
    self.slidingControl.targetYPosition = targetYPosition;

    self.actualTopSpaceConstraint.constant = actualYPosition;
    self.targetTopSpaceConstraint.constant = targetYPosition;

    [self.slidingControl setNeedsDisplay];
}

@end
