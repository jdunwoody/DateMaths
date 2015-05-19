#import "SimpleCollectionViewCell.h"

@implementation SimpleCollectionViewCell


- (void)awakeFromNib
{
    [super awakeFromNib];

    self.starA.hidden = YES;
    self.starB.hidden = YES;
    self.starC.hidden = YES;

    [self configureBorder];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return self;
    }


    return self;
}

- (void)setIlluminated:(BOOL)illuminated
{
    if (illuminated) {
        UIColor *color = self.label.textColor;

        self.label.layer.shadowColor = [color CGColor];
        self.label.layer.shadowRadius = 4.0f;
        self.label.layer.shadowOpacity = .6;
        self.label.layer.shadowOffset = CGSizeZero;
        self.label.layer.masksToBounds = NO;
    } else {
        self.label.layer.shadowColor = nil;
        self.label.layer.shadowRadius = 1.0f;
        self.label.layer.shadowOpacity = 0.0;
        self.label.layer.shadowOffset = CGSizeZero;
        self.label.layer.masksToBounds = NO;
    }
}

- (void)configureBorder
{
    self.layer.cornerRadius = 4.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = self.label.textColor.CGColor;
}

@end
