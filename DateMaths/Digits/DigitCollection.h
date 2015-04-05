//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem;


@interface DigitCollection : NSObject<NSFastEnumeration>

- (instancetype)init __unavailable;
- (instancetype)initWithDate:(NSDate *)date;

- (void)addObject:(id<DataItem>)digit;
- (NSInteger)count;
- (id)objectAtIndexedSubscript:(NSInteger)idx;
@end
