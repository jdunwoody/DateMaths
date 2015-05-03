//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexableCollection.h"

@protocol DataItem;
@class LevelItem;
@class DigitCollection;
@class OperatorCollection;
@class ResultsCollection;
@class DigitFactory;
@class OperatorFactory;

@interface LevelCollection : NSObject<IndexableCollection>

@property (strong, nonatomic) LevelItem *current;

- (instancetype)init __unavailable;
- (instancetype)initWithDigitFactory:(DigitFactory *)digitFactory operatorFactory:(OperatorFactory *)operatorFactory;

- (NSInteger)count;

@end
