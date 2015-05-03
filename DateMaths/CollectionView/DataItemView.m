//
// Created by James Dunwoody on 3/05/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DataItemView.h"
#import "DataItem.h"
#import "SimpleCollectionViewCell.h"


@interface DataItemView ()
@property (nonatomic, readonly) CGSize cellSize;
@end

@implementation DataItemView

- (instancetype)initWithOriginPoint:(CGPoint)point dataItem:(id<DataItem>)dataItem
{
    self = [super init];
    if (!self) {
        return self;
    }

    _rect = CGRectMake(point.x, point.y, [DataItemView cellSize].width, [DataItemView cellSize].height);
    _dataItem = dataItem;

    return self;
}

+ (CGSize)cellSize
{
    return CGSizeMake(SIMPLE_COLLECTION_VIEW_CELL_WIDTH, SIMPLE_COLLECTION_VIEW_CELL_HEIGHT);
}
@end
