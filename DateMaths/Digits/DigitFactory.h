//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Digit;

@interface DigitFactory : NSObject

@property (strong, nonatomic, readonly) NSArray *digits;

- (instancetype)initWithDate:(NSDate *)date;
//- (instancetype)initWithSymbols:(NSArray *)symbols;


@end
