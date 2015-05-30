//
//  CalendarViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import <UIKit/UIKit.h>

@class CalendarDataSource;

@interface CalendarViewController : UIViewController<UIPickerViewDelegate>

@property (strong, nonatomic) UIColor *datePickerTextColor;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *next;

@end
