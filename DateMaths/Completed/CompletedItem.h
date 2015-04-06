//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItem.h"

@interface CompletedItem : NSObject<DataItem>

@property (nonatomic, readonly) double number;
@property (strong, nonatomic) NSString *value;
@property (nonatomic) BOOL completed;

- (instancetype)init __unavailable;
- (instancetype)initWithNumber:(double)number;

@end
