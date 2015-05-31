//
//  SlidingThing.m
//  DateMaths
//
//  Created by James Dunwoody on 31/05/2015.
//
//

#import "SlidingThing.h"
#import "Theme.h"

@interface SlidingThing ()
@end

@implementation SlidingThing

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self configure];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self configure];
    }

    return self;
}

- (void)configure
{
    self.actualYPosition = 10.0f;
    self.targetYPosition = 20.0f;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [Theme colourMain].CGColor);

    CGContextMoveToPoint(context, rect.size.width, rect.origin.y);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);

    CGFloat x1 = rect.size.width - 20.0f;
    CGFloat x2 = rect.size.width;

    // Middle
    CGContextMoveToPoint(context, x1, self.actualYPosition);
    CGContextAddLineToPoint(context, x2, self.actualYPosition);

    // Actual
    CGContextMoveToPoint(context, x1, self.targetYPosition);
    CGContextAddLineToPoint(context, x2, self.targetYPosition);

    CGContextStrokePath(context);
}

@end
