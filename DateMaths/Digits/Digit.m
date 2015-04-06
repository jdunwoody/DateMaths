#import "Digit.h"

@interface Digit ()
@end

@implementation Digit

- (instancetype)initWithDigit:(double)digit
{
    self = [super init];
    if (!self) {
        return self;
    }

    _digit = digit;

    return self;
}

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.digit];
}

@end
