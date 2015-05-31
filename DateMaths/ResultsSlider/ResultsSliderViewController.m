//
//  ResultsSliderViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 31/05/2015.
//
//

#import "ResultsSliderViewController.h"
#import "SlidingThing.h"

@implementation ResultsSliderViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//}

- (void)setActualYValue:(float)actualYValue
{
    _actualYValue = actualYValue;
    self.actualLabel.text = [NSString stringWithFormat:@"%f", self.actualYValue];
    [self update];
}

- (void)setTargetYValue:(float)targetYValue
{
    _targetYValue = targetYValue;
    self.targetLabel.text = [NSString stringWithFormat:@"%f", self.targetYValue];
    [self update];
}

- (void)setMinYValue:(float)minYValue
{
    _minYValue = minYValue;
    [self update];
}

- (void)setMaxYValue:(float)maxYValue
{
    _maxYValue = maxYValue;
    [self update];

}

- (void)update
{
    CGFloat valueRange = self.maxYValue - self.minYValue;
    CGFloat actualValueRatio = self.actualYValue - self.minYValue;
    CGFloat targetValueRatio = self.targetYValue - self.minYValue;
    CGFloat frameRange = self.view.frame.size.height;

    self.slidingControl.actualYPosition = (actualValueRatio / valueRange) * frameRange + self.view.frame.origin.y;
    self.slidingControl.targetYPosition = (targetValueRatio / valueRange) * frameRange + self.view.frame.origin.y;
}

@end
