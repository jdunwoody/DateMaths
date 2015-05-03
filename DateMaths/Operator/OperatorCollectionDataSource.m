//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorCollectionDataSource.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"
#import "LevelCollection.h"

@interface OperatorCollectionDataSource ()
@property (nonatomic, readonly) LevelCollection *collection;
@end

@implementation OperatorCollectionDataSource

- (instancetype)initWithLevelCollection:(LevelCollection *)collection
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
    id<DataItem> item = self.collection[(NSUInteger)indexPath.row];

    cell.label.text = item.value;

    return cell;
}

@end
