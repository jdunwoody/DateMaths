//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem;
@class LevelItem;
@class DigitCollection;
@class OperatorCollection;
@class ResultsCollection;

@interface LevelCollection : NSObject<NSFastEnumeration>

- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;

@property (strong, nonatomic) LevelItem *current;
@property (nonatomic, readonly) DigitCollection *digits;
@property (nonatomic, readonly) OperatorCollection *operators;
@property (nonatomic, readonly) ResultsCollection * results;

- (instancetype)init __unavailable;
- (instancetype)initWithDate:(NSDate *)date;

@end
