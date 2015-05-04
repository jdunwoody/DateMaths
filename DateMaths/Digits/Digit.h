#import <Foundation/Foundation.h>
#import "DataItem.h"

@interface Digit : NSObject<DataItem>

@property (nonatomic, readonly) double digit;
@property (strong, nonatomic, readonly) NSString *value;
@property (nonatomic) BOOL used;
@property (nonatomic) BOOL dragging;

- (instancetype)init __unavailable;
- (instancetype)initWithDigit:(double)digit;

@end
