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

@end
