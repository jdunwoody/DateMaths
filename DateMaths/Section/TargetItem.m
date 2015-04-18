#import "TargetItem.h"


@implementation TargetItem

- (instancetype)initWithNumber:(double)number
{
    self = [super init];
    if (!self) {
        return self;
    }

    _number = number;

    return self;
}

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.number];
}

@end
