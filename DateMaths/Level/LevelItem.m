#import "LevelItem.h"
#import "DigitCollection.h"
#import "OperatorCollection.h"
#import "ResultsCollection.h"
#import "Digit.h"
#import "Operator.h"
#import "OperatorFactory.h"
#import "DigitFactory.h"


@interface LevelItem ()
@end

@implementation LevelItem

- (instancetype)initWithNumber:(double)number digitFactory:(DigitFactory *)digitFactory operatorFactory:(OperatorFactory *)operatorFactory
{
    self = [super init];
    if (!self) {
        return self;
    }

    _number = number;
    _starA = NO;
    _starB = NO;
    _starC = NO;

    _digitCollection = [[DigitCollection alloc] initWithDigits:digitFactory.digits];
    _operatorCollection = [[OperatorCollection alloc] initWithOperators:operatorFactory.operators];
    _resultsCollection = [[ResultsCollection alloc] init];

    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}

- (NSString *)value
{
    return [NSString stringWithFormat:@"%li", (long)self.number];
}

- (NSString *)displayValue
{
    return self.value;
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

- (void)useDigit:(Digit *)digit
{
    digit.used = YES;
    [self.resultsCollection addObject:digit];
}

- (void)useOperator:(Operator *)operator
{
    [self.resultsCollection addObject:operator];
}

- (BOOL)isDigit
{
    return NO;
}

@end
