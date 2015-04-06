#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "SimpleCollectionViewCell.h"

@interface ResultsCollectionViewDataSource ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation ResultsCollectionViewDataSource

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.items = [[NSMutableArray alloc] init];

    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<DataItem> dataItem = self.items[(NSUInteger)indexPath.row];

    cell.label.text = dataItem.value;

    return cell;
}

- (void)addItem:(id<DataItem>)item
{
    [self.items addObject:item];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.items[(NSUInteger)idx];
}

- (void)removeItem:(id<DataItem>)resultItem
{
    [self.items removeObject:resultItem];
}

@end
