#import "TargetItem.h"


@interface TargetItem ()
@end

@implementation TargetItem

- (instancetype)initWithNumber:(double)number
{
    self = [super init];
    if (!self) {
        return self;
    }

    _number = number;
    _starA = NO;
    _starB = NO;
    _starC = NO;

    return self;
}

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.number];
}

@end
