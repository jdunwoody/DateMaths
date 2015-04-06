//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CompletedCollection;

@interface CompletedCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithOperatorCollection:(CompletedCollection *)collection;

@end
