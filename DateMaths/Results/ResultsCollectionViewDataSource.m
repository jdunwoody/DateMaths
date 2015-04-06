#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "SimpleCollectionViewCell.h"
#import "ResultsCollection.h"

@interface ResultsCollectionViewDataSource ()
@property (nonatomic, strong) ResultsCollection *collection;
@end

@implementation ResultsCollectionViewDataSource


- (instancetype)initWithCollection:(ResultsCollection *)collection
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.collection = collection;

    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<DataItem> dataItem = self.collection[(NSUInteger)indexPath.row];

    cell.label.text = dataItem.value;

    return cell;
}

- (void)addItem:(id<DataItem>)item
{
    [self.collection addObject:item];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collection count];
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.collection[(NSUInteger)idx];
}

- (void)removeItem:(id<DataItem>)resultItem
{
    [self.collection removeObject:resultItem];
}

@end
