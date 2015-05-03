#import "LevelCollectionViewDataSource.h"
#import "LevelCollection.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"
#import "LevelItem.h"

@interface LevelCollectionViewDataSource ()
@property (nonatomic, strong) LevelCollection *levelCollection;
@end

@implementation LevelCollectionViewDataSource

- (instancetype)initWithCollection:(LevelCollection *)levelCollection
{
    self = [super init];
    if (!self) {
        return self;
    }

    _levelCollection = levelCollection;

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.levelCollection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    LevelItem *item = self.levelCollection[(NSUInteger)indexPath.row];

    cell.label.text = item.value;
    cell.backgroundColor = self.levelCollection.current == item ? [UIColor whiteColor] : [UIColor lightGrayColor];

    cell.starA.hidden = !item.starA;
    cell.starB.hidden = !item.starB;
    cell.starC.hidden = !item.starC;

    return cell;
}

@end
