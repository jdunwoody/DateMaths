#import "CompletedItem.h"


@implementation CompletedItem

- (instancetype)initWithNumber:(double)number
{
    self = [super init];
    if (!self) {
        return self;
    }

    _number = number;
    _completed = NO;

    return self;
}

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.number];
}

@end
