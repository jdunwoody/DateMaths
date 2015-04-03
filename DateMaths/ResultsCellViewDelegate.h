//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResultsCellViewController;

@protocol ResultsCellViewDelegate<NSObject>

- (void)didTapResultsCellView:(ResultsCellViewController *)controller;

@end
