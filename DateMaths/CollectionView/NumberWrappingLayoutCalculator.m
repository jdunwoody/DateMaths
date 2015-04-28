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

@interface NumberWrappingLayoutCalculator ()
@property (nonatomic, strong) NSMutableArray *rows;
@end

@implementation NumberWrappingLayoutCalculator

- (NSDictionary *)calculateLayoutSizesForDataItems:(NSArray *)items inSize:(CGSize)size ofSize:(CGSize)cellSize
{
    self.rows = [self buildRowsWithItems:items size:&size cellSize:&cellSize];

    NSMutableDictionary *calculatedLayout = [self buildlayoutDirectionaryWithItems:items cellSize:&cellSize rows:self.rows];

    return calculatedLayout;
}

- (NSMutableDictionary *)buildlayoutDirectionaryWithItems:(NSArray *)items cellSize:(CGSize *)cellSize rows:(NSMutableArray *)rows
{
    NSMutableDictionary *calculatedLayout = [NSMutableDictionary dictionaryWithCapacity:(NSUInteger)items.count];

    int y = 0;
    for (NSArray *row in rows) {
        int x = 0;
        for (id<DataItem> item in row) {
            CGRect rect = CGRectMake(x, y, (*cellSize).width, (*cellSize).height);
            calculatedLayout[item] = [NSValue valueWithCGRect:rect];
            x += (*cellSize).width;
        }
        y += (*cellSize).height;
    }
    return calculatedLayout;
}

- (NSMutableArray *)buildRowsWithItems:(NSArray *)items size:(CGSize *)size cellSize:(CGSize *)cellSize
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

        if ((currentRow.count + 1) * (*cellSize).width > (*size).width) {
            if (itemsToKeepTogether.count > 0 && itemsToKeepTogether.count * (*cellSize).width <= (*size).width) {
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

- (CGPoint)locationOfNearestEdgeOfCellNearLocation:(CGPoint)point
{
    CGPoint result;
    return result;
}

@end
