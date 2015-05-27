//
//  BouncyBehaviour.m
//  DateMaths
//
//  Created by James Dunwoody on 19/05/2015.
//
//

#import "BouncyBehaviour.h"

@implementation BouncyBehaviour

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (!self) {
        return nil;
    }

    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    [self addChildBehavior:gravityBehavior];

    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self addChildBehavior:collisionBehavior];

    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    elasticityBehavior.elasticity = 0.7f;
    [self addChildBehavior:elasticityBehavior];

    return self;
}

@end
