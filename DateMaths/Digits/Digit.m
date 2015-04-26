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
    _used = NO;

    return self;
}

#pragma mark - DataItem

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.digit];
}

- (BOOL)isDigit
{
    return YES;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[Digit alloc] initWithDigit:self.digit];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[Digit class]]) {
        return NO;
    }

    return self.digit == ((Digit *)object).digit;
}

- (NSUInteger)hash
{
    return (NSUInteger)(self.digit * 1000.0);
}
@end
