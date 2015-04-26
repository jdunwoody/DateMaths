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

@implementation NumberWrappingLayoutCalculator

+ (NSDictionary *)calculateLayoutSizesForDataItems:(NSArray *)items inSize:(CGSize)size ofSize:(CGSize)cellSize
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

        if ((currentRow.count + 1) * cellSize.width > size.width) {
            if (itemsToKeepTogether.count > 0 && itemsToKeepTogether.count * cellSize.width <= size.width) {
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

//        if (!resultItem.isDigit) {
//            [itemsToKeepTogether removeAllObjects];
//        }

    }

    NSMutableDictionary *calculatedLayout = [NSMutableDictionary dictionaryWithCapacity:(NSUInteger)items.count];

    int y = 0;
    for (NSArray *row in rows) {
        int x = 0;
        for (id<DataItem> item in row) {
            CGRect rect = CGRectMake(x, y, cellSize.width, cellSize.height);
            calculatedLayout[item] = [NSValue valueWithCGRect:rect];
            x += cellSize.width;
        }
        y += cellSize.height;
    }

    return calculatedLayout;
}

@end
