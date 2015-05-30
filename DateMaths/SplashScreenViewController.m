//
//  SplashScreenViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 5/05/2015.
//
//

#import "SplashScreenViewController.h"
#import "UIViewController+jamesGradientBackground.h"
#import "Theme.h"

@interface SplashScreenViewController ()

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SplashScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self dateMaths_gradientBackgroundWhiteToGray];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:NO];
    self.mathsText.textColor = [Theme colourMain];
    self.dateLabel.textColor = [Theme colourMain];

    [self dateMaths_hideNavigationController];
}

- (void)timerFireMethod:(NSTimer *)timer
{
    [self performSegueWithIdentifier:@"datePicker" sender:self];
}

@end
