//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItem.h"

@interface Digit : NSObject<DataItem>
@property (nonatomic, readonly) double digit;
@property (strong, nonatomic) NSString *value;

- (instancetype)initWithDigit:(double)digit;
@end
