//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Digit : NSObject<Cell>
@property (nonatomic, readonly) double digit;
- (instancetype)initWithDigit:(double)digit;
@end
