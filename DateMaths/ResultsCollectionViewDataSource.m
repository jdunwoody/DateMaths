#import "ResultsCollectionViewDataSource.h"
#import "Digit.h"
#import "ResultsCollectionViewCell.h"

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

- (void)addDigit:(id<Cell>)digit
{
    [self.items addObject:digit];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ResultsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Digit *digit = self.items[(NSUInteger)indexPath.row];

    cell.label.text = [NSString stringWithFormat:@"%li", (long)digit.digit];

    return cell;
}

@end
