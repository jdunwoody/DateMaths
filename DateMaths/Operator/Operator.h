//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItem.h"


@interface Operator : NSObject<DataItem>

@property (nonatomic, readonly) NSString *symbol;
@property (nonatomic, readonly) NSString *value;
@property (nonatomic, readonly) NSString *displayValue;
@property (nonatomic) BOOL dragging;

- (instancetype)init __unavailable;

- (instancetype)initWithSymbol:(NSString *)string;
- (instancetype)initWithOperator:(Operator *)anOperator;
@end
