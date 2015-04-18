//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem;
@class TargetItem;

@interface TargetCollection : NSObject<NSFastEnumeration>

- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;

@property (strong, nonatomic) TargetItem *current;

@end