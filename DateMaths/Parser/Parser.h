//
// Created by James Dunwoody on 7/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Parser : NSObject
- (instancetype)init __unavailable;
- (instancetype)initWithParseItems:(NSArray *)parseItems;
- (double)expression;
@end
