//
//  OperatorCellViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 3/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateMathsViewController;
@protocol OperatorCellDelegate;
@class Operator;

@interface OperatorCellViewController : UIViewController

@property (nonatomic, strong) id<OperatorCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) Operator *operator;

- (IBAction)tappedView:(id)sender;

@end
