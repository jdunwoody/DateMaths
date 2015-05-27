#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "SimpleCollectionViewCell.h"
#import "ResultsCollection.h"
#import "LevelCollection.h"
#import "LevelItem.h"

@interface ResultsCollectionViewDataSource ()
@property (nonatomic, strong) LevelCollection *levelCollection;
@end

@implementation ResultsCollectionViewDataSource


- (instancetype)initWithLevelCollection:(LevelCollection *)levelCollection
{
    self = [super init];
    if (!self) {
        return self;
    }

    _levelCollection = levelCollection;

    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<DataItem> dataItem = self.levelCollection.current.resultsCollection[(NSUInteger)indexPath.row];
    cell.dataItem = dataItem;
    cell.backgroundColor = dataItem.dragging ? [UIColor grayColor] : [UIColor clearColor];
    cell.label.text = dataItem.value;

    cell.illuminated = !dataItem.dragging;

    [cell configureBorder];

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger results = [self.levelCollection.current.resultsCollection count];

    return results;
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.levelCollection.current.resultsCollection[(NSUInteger)idx];
}

- (void)removeItem:(id<DataItem>)resultItem
{
    [self.levelCollection.current.resultsCollection removeObject:resultItem];
}

@end
