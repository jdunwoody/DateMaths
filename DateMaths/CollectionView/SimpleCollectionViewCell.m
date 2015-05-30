#import "SimpleCollectionViewCell.h"
#import "CALayer+NewCategory.h"
#import "Theme.h"

@implementation SimpleCollectionViewCell


- (void)awakeFromNib
{
    [super awakeFromNib];

    self.starA.hidden = YES;
    self.starB.hidden = YES;
    self.starC.hidden = YES;

    [self configure];
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
    UIColor *colour;

    if (illuminated) {
        colour = [Theme colourMain];
    } else {
        colour = [Theme deselectedColour];
    }

    [self.layer dateMaths_glowWithColor:colour];
    [self.layer dateMaths_borderWithColor:colour];

    self.label.textColor = colour;
    [self.label.layer dateMaths_glowWithColor:colour];
}

- (void)configure
{
    self.label.textColor = [Theme colourMain];
    self.label.font = [Theme fontWithSize:28];
    [self.layer dateMaths_borderWithColor:[Theme colourMain]];
    [self.layer dateMaths_glowWithColor:[Theme colourMain]];
}

@end
