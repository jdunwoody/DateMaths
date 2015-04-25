#import <UIKit/UIKit.h>

@class LevelCollection;

@interface ResultCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, strong) LevelCollection *levelCollection;
@property (nonatomic, strong) NSMutableArray *calculatedLayout;


@end
