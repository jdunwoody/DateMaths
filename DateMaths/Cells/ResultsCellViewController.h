//
//  ResultsCellViewController.h
//  DateMaths
//
//  Created by James Dunwoody on 3/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResultsCellViewDelegate;
@class Digit;

@interface ResultsCellViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *digitLabel;
@property (nonatomic, strong) id<ResultsCellViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (nonatomic) Digit *digit;
- (IBAction)tapped:(id)sender;

@end
