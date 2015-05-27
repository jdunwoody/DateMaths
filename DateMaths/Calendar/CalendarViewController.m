//
//  CalendarViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import "CalendarViewController.h"
#import "CalendarDataSource.h"
#import "UIColor+NewCategory.h"

@interface CalendarViewController ()

@property (nonatomic, readonly) CalendarDataSource *dataSource;
@end

@implementation CalendarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataSource = [[CalendarDataSource alloc] init];
    self.picker.dataSource = self.dataSource;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];

    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : self.datePickerTextColor}];
    return attString;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (!view) {
        view = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    UILabel *label = (UILabel *)view;
    NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
    label.text = title;
    label.textColor = [UIColor neonPurple];
    UIFont *font = [UIFont fontWithName:@"NEON GLOW" size:32];
    label.font = font;

    return view;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 80.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 80.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSUInteger titleInteger;

    switch ((ComponentsInDatePicker)component) {
        case CalendarDatePickerDayComponent:
            titleInteger = self.dataSource.dateRange.location + row;
            break;
        case CalendarDatePickerMonthComponent:
            titleInteger = self.dataSource.monthRange.location + row;
            break;
        case CalendarDatePickerYearComponent:
            titleInteger = self.dataSource.yearRange.location + row;
            break;
        default:
            titleInteger = 0;
    }

    return [NSString stringWithFormat:@"%lu", (unsigned long)titleInteger];
}

@end
