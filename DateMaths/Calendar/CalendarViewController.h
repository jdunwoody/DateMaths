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

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) UIColor *datePickerTextColor;

@end
