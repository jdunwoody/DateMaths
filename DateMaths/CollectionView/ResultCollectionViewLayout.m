#import "ResultCollectionViewLayout.h"
#import "LevelCollection.h"
#import "ResultsCollection.h"
#import "DataItem.h"
#import "NumberWrappingLayoutCalculator.h"

@protocol DataItem;

@interface ResultCollectionViewLayout ()
@property (nonatomic, strong) NSDictionary *calculatedLayout;
@end

@implementation ResultCollectionViewLayout

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    id<DataItem> item = self.levelCollection.results[(NSUInteger)indexPath.row];
    NSValue *rect = self.calculatedLayout[item];
    attributes.frame = rect.CGRectValue;

    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];

    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }

    return layoutAttributes;
}

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

#pragma mark - Helpers

- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect
{
    NSMutableArray *results = [NSMutableArray array];

    int row = 0;
    for (id<DataItem> item in self.levelCollection.results) {
        [results addObject:[NSIndexPath indexPathForRow:row++ inSection:0]];
    }

    return results;
}

- (void)prepareLayout
{
    [super prepareLayout];

    CGSize cellSize = CGSizeMake(50.0, 50.0);

    self.calculatedLayout = [NumberWrappingLayoutCalculator calculateLayoutSizesForDataItems:self.levelCollection.results.items inSize:self.collectionView.contentSize ofSize:(cellSize)];
}

@end
