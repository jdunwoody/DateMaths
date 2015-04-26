//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Operator.h"


@implementation Operator

- (id)initWithSymbol:(NSString *)symbol
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.symbol = symbol;

    return self;
}

- (NSString *)value
{
    return self.symbol;
}

- (BOOL)isDigit
{
    return NO;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[Operator alloc] initWithSymbol:self.symbol];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[Operator class]]) {
        return NO;
    }

    return self.symbol == ((Operator *)object).symbol;
}

- (NSUInteger)hash
{
    return [self.symbol hash];
}

@end
