//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DigitCollection.h"
#import "Digit.h"


@interface DigitCollection ()
@property (nonatomic, strong) NSArray *digits;
@end

@implementation DigitCollection

- (instancetype)initWithDigits:(NSArray *)digits
{
    self = [super init];
    if (!self) {
        return self;
    }

    _digits = digits;

    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.digits countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSInteger)count
{
    return [self.digits count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.digits[(NSUInteger)idx];
}

- (id)objectForKeyedSubscript:(id)key
{
    for (Digit *digit in self.digits) {
        if (digit == key) {
            return digit;
        }
    }

    return nil;
}

- (int)numUsed
{
    int n = 0;

    for (Digit *digit in self.digits) {
        if (digit.used) {
            n++;
        }
    }

    return n;
}

- (int)percentageUsed
{
    int numUsed = [self numUsed];
    NSInteger count = [self count];

    double fraction = ((double)numUsed) / count;
    return (int)(fraction * 100);
}

- (Digit *)digitWithSymbol:(NSString *)symbol
{
    for (Digit *digit in self.digits) {
        if ([digit.value isEqualToString:symbol]) {
            return digit;
        }
    }

    return nil;
}
@end
