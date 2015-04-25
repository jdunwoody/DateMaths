//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexableCollection.h"

@class Operator;
@class OperatorFactory;

@interface OperatorCollection : NSObject<IndexableCollection>

- (NSInteger)count;
- (instancetype)initWithOperatorFactory:(OperatorFactory *)factory;
- (Operator *)operatorWithSymbol:(NSString *)symbol;

@end
