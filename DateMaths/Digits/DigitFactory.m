//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DigitFactory.h"
#import "Digit.h"


@interface DigitFactory ()
@end

@implementation DigitFactory

- (instancetype)initWithDate:(NSDate *)date
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.digits = [self digitsFromDate:date];

    return self;
}

- (instancetype)initWithSymbols:(NSArray *)symbols
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.digits = [self digitsFromSymbolArray:symbols];

    return self;
}

- (NSArray *)digitsFromDate:(NSDate *)date
{
    NSString *formattedDate = [self formattedDate:date];
    NSArray *symbols = [self symbolsFromDate:formattedDate];
    NSArray *digits = [self digitsFromSymbolArray:symbols];

    return digits;
}

- (NSArray *)digitsFromSymbolArray:(NSArray *)symbols
{
    NSMutableArray *digits = [[NSMutableArray alloc] init];

    for (NSString *symbol in symbols) {
        [digits addObject:[[Digit alloc] initWithDigit:symbol.doubleValue]];
    }

    return digits;
}

- (NSString *)formattedDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/YYYY";

    NSString *formattedDate = [dateFormatter stringFromDate:date];

    NSAssert(formattedDate.length > 0, @"No formatted date");
    return formattedDate;
}

- (NSArray *)symbolsFromDate:(NSString *)formattedDate
{
    NSString *digitString = [[formattedDate componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSUInteger numberOfDigits = [digitString length];

    NSMutableArray *symbols = [[NSMutableArray alloc] initWithCapacity:numberOfDigits];

    for (int i = 0; i < numberOfDigits; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [digitString characterAtIndex:(NSUInteger)i]];
        [symbols addObject:character];
    }
    return symbols;
}

@end
