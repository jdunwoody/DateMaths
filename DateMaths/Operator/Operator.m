//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Operator.h"
#import "OperatorMap.h"


@implementation Operator

- (id)initWithSymbol:(NSString *)symbol
{
    self = [super init];
    if (!self) {
        return self;
    }
    _operatorMap = [[OperatorMap alloc] init];
    _symbol = self.operatorMap[symbol];

    return self;
}

- (instancetype)initWithOperator:(Operator *)anOperator
{
    return [self initWithSymbol:anOperator.symbol];
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
    return self;
}

//- (BOOL)isEqual:(id)object
//{
//    if (self == object) {
//        return YES;
//    }
//
//    if (![object isKindOfClass:[Operator class]]) {
//        return NO;
//    }
//
//    return self.symbol == ((Operator *)object).symbol;
//}
//
//- (NSUInteger)hash
//{
//    return [self.symbol hash];
//}

@end
