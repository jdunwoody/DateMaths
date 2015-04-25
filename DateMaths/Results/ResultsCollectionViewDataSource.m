#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "SimpleCollectionViewCell.h"
#import "ResultsCollection.h"
#import "LevelCollection.h"

@interface ResultsCollectionViewDataSource ()
@property (nonatomic, strong) LevelCollection *collection;
@end

@implementation ResultsCollectionViewDataSource


- (instancetype)initWithCollection:(LevelCollection *)collection
{
    self = [super init];
    if (!self) {
        return self;
    }

    _collection = collection;

    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<DataItem> dataItem = self.collection.results[(NSUInteger)indexPath.row];

    cell.label.text = dataItem.value;

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger results = [self.collection.results count];
    
    return results;
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.collection.results[(NSUInteger)idx];
}

- (void)removeItem:(id<DataItem>)resultItem
{
    [self.collection.results removeObject:resultItem];
}

@end
