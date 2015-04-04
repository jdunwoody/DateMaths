//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"


@interface Operator : NSObject<Item>

@property (nonatomic, copy) NSString *symbol;
@property (strong, nonatomic) NSString *value;

- (instancetype)init __unavailable;
- (id)initWithSymbol:(NSString *)string;

@end
