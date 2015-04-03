//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Operator : NSObject

@property (nonatomic, copy) NSString *symbol;

- (instancetype)init __unavailable;
- (id)initWithSymbol:(NSString *)string;

@end
