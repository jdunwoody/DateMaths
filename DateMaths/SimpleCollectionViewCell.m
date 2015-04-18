#import "SimpleCollectionViewCell.h"
#import "CALayer+NewCategory.h"

@implementation SimpleCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self.layer addBlackBorder];
}

@end
