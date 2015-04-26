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
    NSMutableDictionary *calculatedLayout = [NSMutableDictionary dictionaryWithCapacity:(NSUInteger)items.count];

    NSMutableArray *itemsToKeepTogether = [NSMutableArray array];

    int x = 0;
    int y = 0;

    for (id<DataItem> resultItem in items) {

        if (resultItem.isDigit) {
            [itemsToKeepTogether addObject:resultItem];
        }

        if (x + cellSize.width > size.width) {
            if (itemsToKeepTogether.count > 0 && itemsToKeepTogether.count * cellSize.width <= size.width && x > 0) {
                x = 0;
                y += cellSize.height;
                for (id<DataItem> digit in itemsToKeepTogether) {
                    calculatedLayout[digit] = [NSValue valueWithCGRect:CGRectMake(x, y, cellSize.width, cellSize.height)];
                    x += cellSize.width;
                }
            } else {
                x = 0;
                y += cellSize.height;

                CGRect rect = CGRectMake(x, y, cellSize.width, cellSize.height);
                calculatedLayout[resultItem] = [NSValue valueWithCGRect:rect];
                x += cellSize.width;
            }
        } else {
            CGRect rect = CGRectMake(x, y, cellSize.width, cellSize.height);
            calculatedLayout[resultItem] = [NSValue valueWithCGRect:rect];

            x += cellSize.width;
        }

        if (!resultItem.isDigit) {
            [itemsToKeepTogether removeAllObjects];
        }
    }

    return calculatedLayout;
}

@end
