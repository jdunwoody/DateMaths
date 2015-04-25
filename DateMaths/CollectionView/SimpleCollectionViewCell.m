#import "SimpleCollectionViewCell.h"
#import "CALayer+NewCategory.h"

@implementation SimpleCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self.layer addBlackBorder];

    self.starA.hidden = YES;
    self.starB.hidden = YES;
    self.starC.hidden = YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return self;
    }

    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (!self) {
//        return self;
//    }
//
//    return self;
//}

@end
