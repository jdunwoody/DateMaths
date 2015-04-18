#import "LevelItem.h"
#import "DigitCollection.h"
#import "OperatorCollection.h"
#import "ResultsCollection.h"


@interface LevelItem ()
@end

@implementation LevelItem

- (instancetype)initWithNumber:(double)number withDate:(NSDate *)date
{
    self = [super init];
    if (!self) {
        return self;
    }

    _number = number;
    _starA = NO;
    _starB = NO;
    _starC = NO;

    _digitCollection = [[DigitCollection alloc] initWithDate:date];
    _operatorCollection = [[OperatorCollection alloc] init];
    _resultsCollection = [[ResultsCollection alloc] init];

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
