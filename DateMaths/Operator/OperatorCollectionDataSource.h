//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class OperatorCollection;

@interface OperatorCollectionDataSource : NSObject<UICollectionViewDataSource>
- (instancetype)initWithOperatorCollection:(OperatorCollection *)collection;
@end
