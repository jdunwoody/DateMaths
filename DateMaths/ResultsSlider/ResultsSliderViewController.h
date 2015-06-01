//
//  ResultsSliderViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 31/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SlidingThing;


@interface ResultsSliderViewController : UIViewController

@property (nonatomic) int minYValue;
@property (nonatomic) int maxYValue;
@property (nonatomic) int actualYValue;
@property (nonatomic) int targetYValue;

@property (weak, nonatomic) IBOutlet UILabel *actualLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet SlidingThing *slidingControl;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *targetTopSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *actualTopSpaceConstraint;

@end
