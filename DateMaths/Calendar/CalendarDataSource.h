//
//  CalendarDataSource.h
//  DateMaths
//
//  Created by James Dunwoody on 26/05/2015.
//
//

#import <UIKit/UIKit.h>

@interface CalendarDataSource : NSObject<UIPickerViewDataSource>

- (NSString *)titleForRow:(NSInteger)row component:(NSInteger)component;
@end
