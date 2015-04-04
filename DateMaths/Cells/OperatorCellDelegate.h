//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OperatorCellViewController;

@protocol OperatorCellDelegate<NSObject>

- (void)didTapOperatorCellView:(OperatorCellViewController *)controller;

@end
