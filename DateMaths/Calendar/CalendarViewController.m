//
//  CalendarViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import "CalendarViewController.h"
#import "CalendarDataSource.h"

@interface CalendarViewController ()

@property (nonatomic, readonly) CalendarDataSource *dataSource;
@end

@implementation CalendarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataSource = [[CalendarDataSource alloc] init];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [self.dataSource titleForRow:row component:component];

    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : self.datePickerTextColor}];
    return attString;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (!view) {
        view = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 40.0, 40.0)];
    }
    UILabel *label = (UILabel *)view;
    NSString *title = [self.dataSource titleForRow:row component:component];
    label.text = title;

    return view;
}

@end
