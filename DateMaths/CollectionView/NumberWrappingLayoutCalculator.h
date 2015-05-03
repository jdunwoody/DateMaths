//
//  NumberWrappingLayoutCalculator.h
//  DateMaths
//
//  Created by James Dunwoody on 26/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberWrappingLayoutCalculator : NSObject

@property (nonatomic, strong) NSMutableDictionary *calculatedLayout;
- (void)calculateLayoutSizesForDataItems:(NSArray *)items inSize:(CGSize)size ofSize:(CGSize)size1;

- (CGPoint)locationOfNearestEdgeOfCellNearLocation:(CGPoint)point;

@end
