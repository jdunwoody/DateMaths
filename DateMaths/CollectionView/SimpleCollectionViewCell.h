#import <UIKit/UIKit.h>

@protocol DataItem;

@interface SimpleCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *starA;
@property (weak, nonatomic) IBOutlet UILabel *starB;
@property (weak, nonatomic) IBOutlet UILabel *starC;

@property (nonatomic, strong) id<DataItem> dataItem;
@property (nonatomic) BOOL illuminated;

- (void)configure;
@end

static CGFloat SIMPLE_COLLECTION_VIEW_CELL_WIDTH = 50.0;
static CGFloat SIMPLE_COLLECTION_VIEW_CELL_HEIGHT = 50.0;

