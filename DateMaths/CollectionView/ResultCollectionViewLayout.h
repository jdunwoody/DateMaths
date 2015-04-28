#import <UIKit/UIKit.h>

@class LevelCollection;
@class NumberWrappingLayoutCalculator;

@interface ResultCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, strong) LevelCollection *levelCollection;


- (CGPoint)locationOfNearestEdgeOfCellNearLocation:(CGPoint)point;
@end
