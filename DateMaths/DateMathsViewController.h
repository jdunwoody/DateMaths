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
@class Sounds;
@class ResultsSliderViewController;

@interface DateMathsViewController : UIViewController<UICollectionViewDelegate, CollectionDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *digitCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *operatorCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *resultsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *levelCollectionView;
@property (weak, nonatomic) IBOutlet UIView *levelCollectionContainer;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *dragResultsPanGestureRecogniser;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIView *resultsSliderView;

- (IBAction)panned:(id)sender;

@end
