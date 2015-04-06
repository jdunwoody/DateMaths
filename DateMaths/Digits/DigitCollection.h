#import <Foundation/Foundation.h>

@protocol DataItem;


@interface DigitCollection : NSObject<NSFastEnumeration>

- (instancetype)init __unavailable;
- (instancetype)initWithDate:(NSDate *)date;

- (void)addObject:(id<DataItem>)digit;
- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;
@end
