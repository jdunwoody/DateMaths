#import <UIKit/UIKit.h>

@class LevelCollection;
@class NumberWrappingLayoutCalculator;
@class DataItemView;

@interface ResultCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, strong) LevelCollection *levelCollection;

- (DataItemView *)dataitemViewNearestLocation:(CGPoint)point;

@end
