//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DigitCollection.h"
#import "Digit.h"


@interface DigitCollection ()
@property (nonatomic, strong) NSMutableArray *digits;
@end

@implementation DigitCollection

- (instancetype)initWithDate:(NSDate *)date
{
    self = [super init];
    if (!self) {
        return self;
    }

    NSString *formattedDate = [self formattedDate:date];

    self.digits = [self buildDigitsFromString:formattedDate];

    return self;
}

- (NSString *)formattedDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/YYYY";

    NSString *formattedDate = [dateFormatter stringFromDate:date];

    NSAssert(formattedDate.length > 0, @"No formatted date");
    return formattedDate;
}

- (NSMutableArray *)buildDigitsFromString:(NSString *)formattedDate
{
    NSString *digitString = [[formattedDate componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSUInteger numberOfDigits = [digitString length];
    NSMutableArray *digits = [[NSMutableArray alloc] init];
    for (int i = 0; i < numberOfDigits; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [digitString characterAtIndex:(NSUInteger)i]];

        [digits addObject:[[Digit alloc] initWithDigit:character.doubleValue]];
    }
    return digits;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.digits countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSInteger)count
{
    return [self.digits count];
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.digits[(NSUInteger)idx];
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

@end
