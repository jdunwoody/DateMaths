//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem<NSObject, NSCopying>

@property (nonatomic, readonly) NSString *value;
@property (nonatomic, readonly) NSString *displayValue;
@property (nonatomic) BOOL dragging;

- (BOOL)isDigit;

@end
