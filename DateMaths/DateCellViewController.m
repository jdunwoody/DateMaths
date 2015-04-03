//
//  DateCellViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 30/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "DateCellViewController.h"
#import "DateMathsViewDelegate.h"
#import "CALayer+NewCategory.h"

@interface DateCellViewController ()
@end

@implementation DateCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view.layer addBlackBorder];
}

- (IBAction)tappedView:(id)sender
{
    [self.delegate didTapCellView:self];
}

- (void)setUsed:(BOOL)used
{
    _used = used;
    self.view.backgroundColor = [UIColor lightGrayColor];
}

@end
