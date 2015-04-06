//
//  DateMathsViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 29/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionDataSourceDelegate.h"

@class ResultsCollectionViewDataSource;
@class OperatorCollectionDataSource;
@class ResultsCollection;
@class CompletedCollection;

@interface DateMathsViewController : UIViewController<UICollectionViewDelegate, CollectionDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *digitCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *operatorCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *resultsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *completedCollectionView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *digitHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *operatorHeightLayoutConstraint;

@end
