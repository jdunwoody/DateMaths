//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexableCollection.h"

@protocol DataItem;
@class Digit;

@interface ResultsCollection : NSObject<IndexableCollection>

@property (nonatomic, readonly) NSNumber *sum;
@property (strong, nonatomic, readonly) NSMutableArray *items;

- (NSInteger)count;
- (void)addObject:(id<DataItem>)dataItem;
- (void)removeObject:(id<DataItem>)resultItem;

- (void)moveDataItem:(id<DataItem>)dataItem toDataItem:(id<DataItem>)item;
@end
