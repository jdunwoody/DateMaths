//
//  BouncingCubedViewController.m
//  DateMaths
//
//  Created by James Dunwoody on 19/05/2015.
//
//

#import "BouncingCubedViewController.h"
#import "BouncyBehaviour.h"
#import "UIViewController+jamesGradientBackground.h"

@interface BouncingCubedViewController ()

@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation BouncingCubedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self dateMaths_gradientBackgroundWhiteToGray];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    NSArray *items = @[self.yellowCube, self.greenCube];

    BouncyBehaviour *bouncyBehaviour = [[BouncyBehaviour alloc] initWithItems:items];
    [self.animator addBehavior:bouncyBehaviour];
}

@end
