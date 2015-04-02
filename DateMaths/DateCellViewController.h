//
//  DateCellViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 30/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateMathsViewDelegate;

@interface DateCellViewController : UIViewController<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *digitLabel;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecogniser;
@property (nonatomic, strong) id<DateMathsViewDelegate> delegate;

- (IBAction)tappedView:(id)sender;

@end
