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

@property (nonatomic) float minYValue;
@property (nonatomic) float maxYValue;
@property (nonatomic) float actualYValue;
@property (nonatomic) float targetYValue;

@property (weak, nonatomic) IBOutlet UILabel *actualLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet SlidingThing *slidingControl;


@end
