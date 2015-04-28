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
@class LevelCollection;
@class ResultCollectionViewLayout;

@interface DateMathsViewController : UIViewController<UICollectionViewDelegate, CollectionDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *digitCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *operatorCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *resultsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *levelCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)panned:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *dragResultsPanGestureRecogniser;

@end
