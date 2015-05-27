//
//  CalendarDataSource.m
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import "CalendarDataSource.h"

@interface CalendarDataSource ()
@end

@implementation CalendarDataSource

- (instancetype)init
{
    self = [super init];

    if (self) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *currentDate = [NSDate date];

        _dateRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:currentDate];
        _monthRange = [calendar rangeOfUnit:NSCalendarUnitMonth inUnit:NSCalendarUnitYear forDate:currentDate];
        _yearRange = NSRangeFromString(@"1970 50");
    }

    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger numberOfRows;

    switch ((ComponentsInDatePicker)component) {
        case CalendarDatePickerDayComponent:
            numberOfRows = self.dateRange.length;
            break;
        case CalendarDatePickerMonthComponent:
            numberOfRows = self.monthRange.length;
            break;
        case CalendarDatePickerYearComponent:
            numberOfRows = self.yearRange.length;
            break;
        default:
            numberOfRows = 0;
    }

    return numberOfRows;
}

@end
