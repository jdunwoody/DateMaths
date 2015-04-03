//
//  DateMathsViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 29/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "DateMathsViewController.h"
#import "Digit.h"
#import "DateCellViewController.h"
#import "ResultsCellViewController.h"
#import "DigitCollection.h"
#import "CALayer+NewCategory.h"
#import "Operator.h"
#import "OperatorCollection.h"
#import "OperatorCellViewController.h"

@interface DateMathsViewController ()
@property (nonatomic, readonly) NSString *formattedDate;
@property (nonatomic, strong) DigitCollection *digitCollection;
@property (nonatomic, strong) OperatorCollection *operatorCollection;
@end

@implementation DateMathsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.digitCollection = [[DigitCollection alloc] initWithDate:[NSDate date]];
    self.operatorCollection = [[OperatorCollection alloc] init];


    [self.dateDigitsScrollView.layer addBlackBorder];
    [self.operatorScrollView.layer addBlackBorder];
    [self.resultsScrollView.layer addBlackBorder];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self createDigitViews];
    [self createOperatorViews];

    [self layoutDateCells];
}

- (void)layoutDateCells
{
    CGFloat cellWidth = self.dateDigitsScrollView.frame.size.width / [self.dateDigitsScrollView.subviews count];
    CGFloat cellHeight = self.dateDigitsScrollView.frame.size.height;

    CGFloat currentContentWidth = 0.0f;

    for (UILabel *dateCell in self.dateDigitsScrollView.subviews) {
        dateCell.frame = CGRectMake(currentContentWidth, 0.0f, cellWidth, cellHeight);
        currentContentWidth += cellWidth;
    }

    self.dateDigitsScrollView.contentSize = CGSizeMake(currentContentWidth, cellHeight);
}

- (void)createOperatorViews
{
    __block CGFloat currentContentWidth = 0;

    for (Operator *operator in self.operatorCollection) {
        OperatorCellViewController *operatorCellViewController = [[OperatorCellViewController alloc] initWithNibName:@"OperatorCellViewController" bundle:[NSBundle mainBundle]];
        operatorCellViewController.delegate = self;

        [self.operatorScrollView addSubview:operatorCellViewController.view];
        [self addChildViewController:operatorCellViewController];
        [operatorCellViewController didMoveToParentViewController:self];

//        CGFloat edgeLength = self.operatorScrollView.bounds.size.height;
        UILabel *label = operatorCellViewController.label;
        label.text = operator.symbol;
        CGFloat width = operatorCellViewController.view.bounds.size.width;
        CGFloat height = operatorCellViewController.view.bounds.size.height;

        operatorCellViewController.view.frame = CGRectMake(currentContentWidth, 0.0f, width, height);

        currentContentWidth += width;

    };

    self.operatorScrollView.contentSize = CGSizeMake(currentContentWidth, self.operatorScrollView.frame.size.height);
}

- (void)createDigitViews
{
    __block CGFloat width = 0;
    __block CGFloat height = 0;

    for (Digit *digit in self.digitCollection) {
        DateCellViewController *dateCellViewController = [[DateCellViewController alloc] initWithNibName:@"DateCellViewController" bundle:[NSBundle mainBundle]];
        dateCellViewController.delegate = self;
        dateCellViewController.digit = digit;

        [self.dateDigitsScrollView addSubview:dateCellViewController.view];
        [self addChildViewController:dateCellViewController];
        [dateCellViewController didMoveToParentViewController:self];

//        CGFloat edgeLength = self.dateDigitsScrollView.bounds.size.height;
        UILabel *digitLabel = dateCellViewController.digitLabel;//[[UILabel alloc] initWithFrame:CGRectMake(width, 0, edgeLength, edgeLength)];
        digitLabel.text = [NSString stringWithFormat:@"%li", (long)digit.digit];
        width += digitLabel.bounds.size.width;
        height = digitLabel.bounds.size.height;
    };

    self.dateDigitsScrollView.contentSize = CGSizeMake(width, height);
}

#pragma mark - DateMathsViewDelegate

- (void)didTapCellView:(DateCellViewController *)dateCellViewController
{
    if (dateCellViewController.used) {
        return;
    }

    dateCellViewController.used = YES;

    ResultsCellViewController *resultsCellViewController = [[ResultsCellViewController alloc] initWithNibName:@"ResultsCellViewController" bundle:[NSBundle mainBundle]];
    resultsCellViewController.digit = dateCellViewController.digit;

    [self.resultsScrollView addSubview:resultsCellViewController.view];
    [self addChildViewController:resultsCellViewController];
    [resultsCellViewController didMoveToParentViewController:self];

    CGFloat width = resultsCellViewController.view.bounds.size.width;
    CGFloat height = resultsCellViewController.view.bounds.size.height;

    resultsCellViewController.view.frame = CGRectMake(self.resultsScrollView.contentSize.width, 0, width, height);
    self.resultsScrollView.contentSize = CGSizeMake(self.resultsScrollView.contentSize.width + width, height);
}

- (void)didTapResultsCellView:(ResultsCellViewController *)resultsCellViewController
{
    [resultsCellViewController removeFromParentViewController];
    [resultsCellViewController.view removeFromSuperview];

//    CGFloat width = resultsCellViewController.view.bounds.size.width;
//    CGFloat height = resultsCellViewController.view.bounds.size.height;
//
//    resultsCellViewController.view.frame = CGRectMake(self.resultsScrollView.contentSize.width, 0, width, height);
//    self.resultsScrollView.contentSize = CGSizeMake(self.resultsScrollView.contentSize.width + width, height);
}

@end
