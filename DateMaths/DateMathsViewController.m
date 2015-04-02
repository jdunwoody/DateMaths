//
//  DateMathsViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 29/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "DateMathsViewController.h"
#import "DateMathsViewModel.h"
#import "Digit.h"
#import "DateCellViewController.h"

@interface DateMathsViewController ()
@property (strong, nonatomic) DateMathsViewModel *dateMathsViewModel;
@property (nonatomic, readonly) NSString *formattedDate;
@property (nonatomic, readonly) NSMutableArray *dateCells;
@end

@implementation DateMathsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dateDigitsScrollView.layer.borderWidth = 1.0f;
    self.dateDigitsScrollView.layer.borderColor = [UIColor blackColor].CGColor;

    self.operatorScrollView.layer.borderWidth = 1.0f;
    self.operatorScrollView.layer.borderColor = [UIColor blackColor].CGColor;

    self.dateMathsViewModel = [[DateMathsViewModel alloc] initWithDate:[NSDate date]];

    NSString *formattedDate = self.dateMathsViewModel.formattedDate;
    self.formattedDateLabel.text = formattedDate;

    NSMutableArray *digits = [self extractDigitsFromString:formattedDate];

    [self createDigitViewsWithDigits:digits];

    //    self.dateDigitsScrollView.contentSize
    //    self.resultsScrollView;
    //    self.operatorScrollView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    CGFloat cellWidth = self.dateDigitsScrollView.frame.size.width / [self.dateDigitsScrollView.subviews count];
    CGFloat cellHeight = self.dateDigitsScrollView.frame.size.height;

    CGFloat currentContentWidth = 0.0f;

    for (UILabel *dateCell in self.dateDigitsScrollView.subviews) {
        dateCell.frame = CGRectMake(currentContentWidth, 0.0f, cellWidth, cellHeight);
        currentContentWidth += cellWidth;
    }

    self.dateDigitsScrollView.contentSize = CGSizeMake(currentContentWidth, cellHeight);
}

- (void)createDigitViewsWithDigits:(NSMutableArray *)digits
{
    __block CGFloat width = 0;
    __block CGFloat height = 0;

    [digits enumerateObjectsUsingBlock:^(Digit *digit, NSUInteger idx, BOOL *stop) {
        DateCellViewController *dateCellViewController = [[DateCellViewController alloc] initWithNibName:@"DateCellViewController" bundle:[NSBundle mainBundle]];
        dateCellViewController.delegate = self;
        [self.dateCells addObject:dateCellViewController];

        CGFloat edgeLength = self.dateDigitsScrollView.bounds.size.height;
        UILabel *digitLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, 0, edgeLength, edgeLength)];
        digitLabel.text = [NSString stringWithFormat:@"%li", (long)digit.digit];
        width += digitLabel.bounds.size.width;
        height = digitLabel.bounds.size.height;

        [self.dateDigitsScrollView addSubview:dateCellViewController.view];
        [self addChildViewController:dateCellViewController];
        [dateCellViewController didMoveToParentViewController:self];
    }];

    self.dateDigitsScrollView.contentSize = CGSizeMake(width, height);
}

- (NSMutableArray *)extractDigitsFromString:(NSString *)formattedDate
{
    NSString *digitString = [[formattedDate componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSUInteger numberOfDigits = [digitString length];
    NSMutableArray *digits = [[NSMutableArray alloc] init];
    for (int i = 0; i < numberOfDigits; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [digitString characterAtIndex:(NSUInteger)i]];
        [digits addObject:[[Digit alloc] initWithDigit:character.doubleValue]];
    }
    return digits;
}

#pragma mark - DateMathsViewDelegate

- (void)didTapCellView:(DateCellViewController *)dateCellViewController
{
    [dateCellViewController.view removeFromSuperview];
    [self.resultsScrollView addSubview:dateCellViewController.view];
}

@end
