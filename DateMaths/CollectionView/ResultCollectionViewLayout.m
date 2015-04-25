#import "ResultCollectionViewLayout.h"
#import "LevelCollection.h"
#import "ResultsCollection.h"
#import "DataItem.h"

@protocol DataItem;

@implementation ResultCollectionViewLayout

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    NSValue *rect = self.calculatedLayout[(NSUInteger)indexPath.row];
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

//    NSMutableArray *elementsInRect = [NSMutableArray array];
//
//    //iterate over all cells in this collection
//    for (NSUInteger i = 0; i < [self.collectionView numberOfSections]; i++) {
//        for (NSUInteger j = 0; j < [self.collectionView numberOfItemsInSection:i]; j++) {
//            //this is the cell at row j in section i
//            CGRect cellFrame = CGRectMake(
//                /* calculate your origin x */,
//                /* calculate your origin y */,
//                /* calculate your width */,
//                /* calculate your height */);
//
//            //see if the collection view needs this cell
//            if (CGRectIntersectsRect(cellFrame, rect)) {
//                //create the attributes object
//                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
//                UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//
//                //set the frame for this attributes object
//                attr.frame = cellFrame;
//                [elementsInRect addObject:attr];
//            }
//        }
//    }
//
//    return elementsInRect;
//}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//
//    CGRect cellFrame = CGRectZero;
////    CGRectMake(/* calculate your origin x */,
////        /* calculate your origin y */,
////        /* calculate your width */,
////       /* calculate your height */);
//    attr.frame = cellFrame;
//
//    return attr;
//}

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
//
//    [attributes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        UICollectionViewLayoutAttributes *attr = obj;
//        float newYCoord = [self calculationMethodYouHaveToWriteFor:attr.frame];
//        attr.frame = CGRectMake(attr.frame.origin.x, newYCoord, attr.size.width, attr.size.height);
//    }];
//
//    return attributes;
//}
//
//- (float)calculationMethodYouHaveToWriteFor:(CGRect)rect
//{
//    return 0;
//}
//- (CGSize)collectionViewContentSize
//{
//    return CGSizeMake(200.0, 200.0);
//}
//

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

    self.calculatedLayout = [NSMutableArray arrayWithCapacity:(NSUInteger)self.levelCollection.results.count];


    NSMutableArray *itemsToKeepTogether = [NSMutableArray array];
    BOOL previousIsDigit = NO;

    int x = 0;
    int y = 0;
    const int cellWidth = 50;
    const int cellHeight = 50;

    for (id<DataItem> resultItem in self.levelCollection.results) {

        if (resultItem.isDigit) {
            [itemsToKeepTogether addObject:resultItem];

            previousIsDigit = YES;
        } else {
            [self moveToNewLine:itemsToKeepTogether];

            previousIsDigit = NO;
            [itemsToKeepTogether removeAllObjects];
        }

        if (x + cellWidth > self.collectionView.contentSize.width) {
            x = 0;
            y += cellHeight;
        }

        CGRect rect = CGRectMake(x, y, cellWidth, cellHeight);
        [self.calculatedLayout addObject:[NSValue valueWithCGRect:rect]];

        x += cellWidth;
    }
}

- (void)moveToNewLine:(NSMutableArray *)array
{

}

@end
