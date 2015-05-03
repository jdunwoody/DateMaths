#import "ResultCollectionViewLayout.h"
#import "LevelCollection.h"
#import "ResultsCollection.h"
#import "DataItem.h"
#import "NumberWrappingLayoutCalculator.h"
#import "SimpleCollectionViewCell.h"
#import "LevelItem.h"

@protocol DataItem;

@interface ResultCollectionViewLayout ()
@property (nonatomic, strong) NSDictionary *calculatedLayout;
@property (nonatomic, strong) NumberWrappingLayoutCalculator *calculator;
@end

@implementation ResultCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    [self commonInit];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self) {
        return self;
    }

    [self commonInit];

    return self;
}

- (void)commonInit
{
    self.calculator = [[NumberWrappingLayoutCalculator alloc] init];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    id<DataItem> item = self.levelCollection.current.resultsCollection[(NSUInteger)indexPath.row];
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

//    for (id<DataItem> item in self.levelCollection.current.resultsCollection) {
//        [results addObject:item];
//    }

    for (int i = 0; i < self.levelCollection.current.resultsCollection.count; i++) {
        [results addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }

    return results;
}

- (void)prepareLayout
{
    [super prepareLayout];

    CGSize cellSize = CGSizeMake(SIMPLE_COLLECTION_VIEW_CELL_WIDTH, SIMPLE_COLLECTION_VIEW_CELL_WIDTH);

    [self.calculator calculateLayoutSizesForDataItems:self.levelCollection.current.resultsCollection.items inSize:self.collectionView.contentSize ofSize:(cellSize)];
    self.calculatedLayout = self.calculator.calculatedLayout;
}

- (CGPoint)locationOfNearestEdgeOfCellNearLocation:(CGPoint)point
{
    return [self.calculator locationOfNearestEdgeOfCellNearLocation:point];
}

@end
