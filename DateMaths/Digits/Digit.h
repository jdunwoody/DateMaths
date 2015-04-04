//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Digit : NSObject<Item>
@property (nonatomic, readonly) double digit;
@property (strong, nonatomic) NSString *value;

- (instancetype)initWithDigit:(double)digit;
@end
