//
//  NumberWrappingLayoutCalculator.h
//  DateMaths
//
//  Created by James Dunwoody on 26/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataItemView;

@interface NumberWrappingLayoutCalculator : NSObject

@property (nonatomic, strong) NSArray *dataItems;
- (void)calculateLayoutSizesForDataItems:(NSArray *)items inSize:(CGSize)size;

- (DataItemView *)dataItemViewNearestLocationNearLocation:(CGPoint)location;

@end
