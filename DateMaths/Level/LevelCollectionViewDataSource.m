#import "LevelCollectionViewDataSource.h"
#import "LevelCollection.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"
#import "LevelItem.h"

@interface LevelCollectionViewDataSource ()
@property (nonatomic, strong) LevelCollection *collection;
@end

@implementation LevelCollectionViewDataSource

- (instancetype)initWithCollection:(LevelCollection *)collection
{
    self = [super init];
    if (!self) {
        return self;
    }

    _collection = collection;

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    LevelItem *item = self.collection[(NSUInteger)indexPath.row];

    cell.label.text = item.value;
    cell.backgroundColor = self.collection.current == item ? [UIColor whiteColor] : [UIColor lightGrayColor];

    cell.starA.hidden = !item.starA;
    cell.starB.hidden = !item.starB;
    cell.starC.hidden = !item.starC;

    return cell;
}

@end
