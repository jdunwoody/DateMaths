//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IndexableCollection<NSObject, NSFastEnumeration>

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

@end
