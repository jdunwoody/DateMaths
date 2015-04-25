//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OperatorFactory : NSObject

- (instancetype)initWithSymbols:(NSArray *)symbols;

- (NSArray *)operators;

@end
