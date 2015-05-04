//
//  NumberWrappingLayoutCalculator.m
//  DateMaths
//
//  Created by James Dunwoody on 26/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "NumberWrappingLayoutCalculator.h"
#import "DataItem.h"
#import "DataItemView.h"

@interface NumberWrappingLayoutCalculator ()
@end

@implementation NumberWrappingLayoutCalculator

- (void)calculateLayoutSizesForDataItems:(NSArray *)items inSize:(CGSize)size
{
    NSArray *rows = [self buildRowsWithItems:items size:&size];

    self.dataItems = [self buildDataItemViewsFromItems:items rows:rows];
}

- (NSArray *)buildDataItemViewsFromItems:(NSArray *)items rows:(NSArray *)rows
{
    NSMutableArray *dataItems = [NSMutableArray arrayWithCapacity:(NSUInteger)items.count];

    int y = 0;
    for (NSArray *row in rows) {
        int x = 0;
        for (id<DataItem> item in row) {
            CGPoint origin = CGPointMake(x, y);
            DataItemView *dataItemView = [[DataItemView alloc] initWithOriginPoint:origin dataItem:item];
            [dataItems addObject:dataItemView];
            x += dataItemView.rect.size.width;
        }
        y += [DataItemView cellSize].height;
    }

    return dataItems;
}

- (NSArray *)buildRowsWithItems:(NSArray *)items size:(CGSize *)size
{
    NSMutableArray *rows = [NSMutableArray array];

    NSMutableArray *currentRow = [NSMutableArray array];
    [rows addObject:currentRow];
    NSMutableArray *itemsToKeepTogether = [NSMutableArray array];

    for (id<DataItem> resultItem in items) {

        if (resultItem.isDigit) {
            [itemsToKeepTogether addObject:resultItem];
        } else {
            [itemsToKeepTogether removeAllObjects];
        }

        if ((currentRow.count + 1) * [DataItemView cellSize].width > (*size).width) {
            if (itemsToKeepTogether.count > 0 && itemsToKeepTogether.count * [DataItemView cellSize].width <= (*size).width) {
                for (NSMutableArray *row in rows) {
                    [row removeObjectsInArray:itemsToKeepTogether];
                }

                currentRow = [NSMutableArray array];
                [rows addObject:currentRow];

                for (id<DataItem> digit in itemsToKeepTogether) {
                    [currentRow addObject:digit];
                }
            } else {
                currentRow = [NSMutableArray array];
                [rows addObject:currentRow];

                [currentRow addObject:resultItem];
            }
        } else {
            [currentRow addObject:resultItem];
        }
    }

    return rows;
}

- (DataItemView *)dataItemViewNearestLocationNearLocation:(CGPoint)location
{
    DataItemView *result;

    for (DataItemView *dataItemView in self.dataItems) {
        CGRect rect = dataItemView.rect;

        if (location.y > CGRectGetMinY(rect) && location.y < CGRectGetMaxY(rect)) {

            if (location.x > CGRectGetMinX(rect) && location.x < CGRectGetMaxX(rect)) {
                return dataItemView;

            } else {
                result = dataItemView;
            }
        }
    }

    return result;
}

@end
