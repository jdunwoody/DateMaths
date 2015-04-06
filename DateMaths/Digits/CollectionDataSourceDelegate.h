//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CollectionDataSourceDelegate

- (void)didLayoutCell:(NSIndexPath *)path inCollectionView:(UICollectionView *)view;

@end
