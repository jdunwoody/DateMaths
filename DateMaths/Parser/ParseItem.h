//
// Created by James Dunwoody on 8/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataItem;

@interface ParseItem : NSObject

@property (nonatomic, readonly) BOOL isPlus;
@property (nonatomic, readonly) BOOL isMinus;
@property (nonatomic, readonly) BOOL isMulti;
@property (nonatomic, readonly) BOOL isDivide;
@property (nonatomic, readonly) BOOL isCloseParen;
@property (nonatomic, readonly) BOOL isOpenParen;
@property (nonatomic, readonly) BOOL isDigit;

@property (nonatomic, readonly) double digit;

@property (nonatomic) BOOL isOperator;
- (instancetype)init __unavailable;
- (instancetype)initWithCharacter:(unichar)i;

@end
