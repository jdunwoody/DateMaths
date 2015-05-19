//
//  SplashScreenViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 5/05/2015.
//
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SplashScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:NO];
}

- (void)timerFireMethod:(NSTimer *)timer
{
    [self performSegueWithIdentifier:@"datePicker" sender:self];
}

@end
