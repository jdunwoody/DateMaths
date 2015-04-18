#import <Foundation/Foundation.h>

@protocol DataItem;


@interface DigitCollection : NSObject<NSFastEnumeration>

@property (nonatomic, readonly) int numUsed;
@property (nonatomic, readonly) int percentageUsed;

- (instancetype)init __unavailable;
- (instancetype)initWithDate:(NSDate *)date;

- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;

@end
