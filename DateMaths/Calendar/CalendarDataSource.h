//
//  CalendarDataSource.h
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import <UIKit/UIKit.h>

@interface CalendarDataSource : NSObject<UIPickerViewDataSource>

@property (nonatomic, readonly) NSRange dateRange;
@property (nonatomic, readonly) NSRange monthRange;
@property (nonatomic, readonly) NSRange yearRange;

typedef enum
{
    CalendarDatePickerDayComponent = 0,
    CalendarDatePickerMonthComponent = 1,
    CalendarDatePickerYearComponent = 2,
} ComponentsInDatePicker;

@end
