//
// Created by James Dunwoody on 2/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DateCellViewController;

@protocol DateMathsViewDelegate<NSObject>

- (void)didTapCellView:(DateCellViewController *)controller;

@end
