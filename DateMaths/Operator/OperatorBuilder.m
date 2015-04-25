//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorBuilder.h"
#import "Operator.h"


@implementation OperatorBuilder

+ (NSArray *)operatorsWithSymbols:(NSArray *)symbols
{
    NSMutableArray *operators = [NSMutableArray arrayWithCapacity:symbols.count];

    for (NSString *symbol in symbols) {
        [operators addObject:[[Operator alloc] initWithSymbol:symbol]];
    }

    return operators;
}

@end
