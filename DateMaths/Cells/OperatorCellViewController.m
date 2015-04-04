//
//  OperatorCellViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 3/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "OperatorCellViewController.h"
#import "CALayer+NewCategory.h"
#import "Operator.h"
#import "OperatorCellDelegate.h"

@interface OperatorCellViewController ()

@end

@implementation OperatorCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view.layer addBlackBorder];
}

- (void)setOperator:(Operator *)operator
{
    _operator = operator;

    self.label.text = [NSString stringWithFormat:@"%@", operator.symbol];
}

- (IBAction)tappedView:(id)sender
{
    [self.delegate didTapOperatorCellView:self];
}

@end
