//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorCollectionDataSource.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"
#import "LevelCollection.h"
#import "LevelItem.h"
#import "OperatorCollection.h"

@interface OperatorCollectionDataSource ()
@property (nonatomic, readonly) LevelCollection *levelCollection;
@end

@implementation OperatorCollectionDataSource

- (instancetype)initWithLevelCollection:(LevelCollection *)levelCollection
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
    return [self.levelCollection.current.operatorCollection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    id<DataItem> item = self.levelCollection.current.operatorCollection[(NSUInteger)indexPath.row];

    cell.label.text = item.value;

    return cell;
}

@end
