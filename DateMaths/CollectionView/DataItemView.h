//
// Created by James Dunwoody on 3/05/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataItem;

@interface DataItemView : NSObject

@property (nonatomic, readonly) CGRect rect;
@property (nonatomic, readonly) id<DataItem> dataItem;

+ (CGSize)cellSize;

- (instancetype)init __unavailable;
- (instancetype)initWithOriginPoint:(CGPoint)point dataItem:(id<DataItem>)dataItem;

@end
