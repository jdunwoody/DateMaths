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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<Item> item = self.items[(NSUInteger)indexPath.row];

    cell.label.text = item.value;
    cell.backgroundColor = [UIColor whiteColor];
    cell.label.textColor = [UIColor blackColor];
    return cell;
}

- (void)addItem:(id<Item>)item
{
    [self.items addObject:item];
}

@end
