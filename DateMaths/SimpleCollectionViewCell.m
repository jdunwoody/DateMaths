#import "SimpleCollectionViewCell.h"
#import "CALayer+NewCategory.h"

@implementation SimpleCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self.layer addBlackBorder];

    self.starA.hidden = !self.hasStars;
    self.starB.hidden = !self.hasStars;
    self.starC.hidden = !self.hasStars;
}

@end
