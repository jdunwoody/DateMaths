//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem;

@interface ResultsCollection : NSObject<NSFastEnumeration>

@property (nonatomic, readonly) NSInteger sum;

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len;
- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (void)addObject:(id<DataItem>)o;
- (void)removeObject:(id<DataItem>)resultItem;

@end
