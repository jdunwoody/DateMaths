#import <Foundation/Foundation.h>
#import "DataItem.h"

@interface Digit : NSObject<DataItem>

@property (nonatomic, readonly) double digit;
@property (nonatomic, readonly) NSString *value;
@property (nonatomic, readonly) NSString *displayValue;
@property (nonatomic) BOOL used;
@property (nonatomic) BOOL dragging;

- (instancetype)init __unavailable;
- (instancetype)initWithDigit:(double)digit;

@end
