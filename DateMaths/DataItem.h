//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem<NSObject>

@property (strong, nonatomic) NSString *value;

- (BOOL)isDigit;

@end
