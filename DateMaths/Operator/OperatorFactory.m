//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorFactory.h"


@interface OperatorFactory ()
@property (nonatomic, readonly) NSArray *symbols;
@end

@implementation OperatorFactory

- (instancetype)initWithSymbols:(NSArray *)symbols
{
    self = [super init];
    if (!self) {
        return self;
    }
    _symbols = symbols;

    return self;
}

@end
