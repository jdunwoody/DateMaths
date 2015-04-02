//
//  DateCellViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 30/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "DateCellViewController.h"
#import "DateMathsViewDelegate.h"

@interface DateCellViewController ()
@end

@implementation DateCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.layer.borderWidth = 1.0f;
}

- (IBAction)tappedView:(id)sender
{
    [self.delegate didTapCellView:self];
}

@end
