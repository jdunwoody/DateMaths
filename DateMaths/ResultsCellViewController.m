//
//  ResultsCellViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 3/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "ResultsCellViewController.h"
#import "ResultsCellViewDelegate.h"
#import "CALayer+NewCategory.h"

@interface ResultsCellViewController ()

@end

@implementation ResultsCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view.layer addBlackBorder];
}

- (IBAction)tapped:(id)sender
{
    [self.delegate didTapResultsCellView:self];
}

@end
