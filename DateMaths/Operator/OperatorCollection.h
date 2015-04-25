//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexableCollection.h"
@class Operator;

@interface OperatorCollection : NSObject<IndexableCollection>

- (NSInteger)count;
- (Operator *)operatorWithSymbol:(NSString *)symbol;

@end
