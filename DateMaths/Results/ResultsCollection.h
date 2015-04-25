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

//- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len;
- (NSInteger)count;
- (void)addObject:(id<DataItem>)dataItem;
- (void)removeObject:(id<DataItem>)resultItem;

@end
