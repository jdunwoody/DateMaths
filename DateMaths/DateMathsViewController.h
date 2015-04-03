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

@interface DateMathsViewController : UIViewController<DateMathsViewDelegate, ResultsCellViewDelegate, OperatorCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *formattedDateLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *dateDigitsScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *operatorScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *resultsScrollView;

@end
