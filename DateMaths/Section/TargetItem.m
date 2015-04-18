#import "TargetItem.h"
#import "DigitCollection.h"


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

- (void)updateStarsWithSum:(NSNumber *)sum witDigitsCollection:(DigitCollection *)digitCollection
{
    if (self.number == [sum doubleValue]) {
        if (digitCollection.numUsed > 0) {
            self.starA = YES;
        }

        if (digitCollection.percentageUsed >= 50) {
            self.starB = YES;
        }

        if (digitCollection.percentageUsed == 100) {
            self.starC = YES;
        }
    }
}

@end
