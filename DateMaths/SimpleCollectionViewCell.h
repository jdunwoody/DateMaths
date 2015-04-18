#import <UIKit/UIKit.h>

@interface SimpleCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *starA;
@property (weak, nonatomic) IBOutlet UILabel *starB;
@property (weak, nonatomic) IBOutlet UILabel *starC;

@property (nonatomic) BOOL hasStars;
@end
