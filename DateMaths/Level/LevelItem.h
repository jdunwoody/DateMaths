//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItem.h"

@class DigitCollection;
@class OperatorCollection;
@class ResultsCollection;
@class Digit;
@class Operator;
@class OperatorFactory;
@class DigitFactory;

@interface LevelItem : NSObject<DataItem>

@property (nonatomic, readonly) double number;
@property (strong, nonatomic) NSString *value;

- (instancetype)init __unavailable;
- (instancetype)initWithNumber:(double)number digitFactory:(DigitFactory *)digitFactory operatorFactory:(OperatorFactory *)operatorFactory;

@property (nonatomic) BOOL starA;
@property (nonatomic) BOOL starB;
@property (nonatomic) BOOL starC;

@property (nonatomic, strong, readonly) DigitCollection *digitCollection;
@property (nonatomic, strong, readonly) OperatorCollection *operatorCollection;
@property (nonatomic, strong, readonly) ResultsCollection *resultsCollection;

- (void)updateStarsWithSum:(NSNumber *)sum witDigitsCollection:(DigitCollection *)digitCollection;

- (void)useDigit:(Digit *)digit;
- (void)useOperator:(Operator *)anOperator;
@end