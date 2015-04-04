//
//  DateMathsViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 29/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateMathsViewDelegate.h"
#import "ResultsCellViewDelegate.h"
#import "OperatorCellDelegate.h"

@class ResultsCollectionViewDataSource;

@interface DateMathsViewController : UIViewController<DateMathsViewDelegate, ResultsCellViewDelegate, OperatorCellDelegate, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *dateDigitsScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *operatorScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *resultsScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *resultsCollectionView;

@end
