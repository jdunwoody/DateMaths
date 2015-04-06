//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "CompletedCollectionViewDataSource.h"
#import "CompletedCollection.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"

@interface CompletedCollectionViewDataSource ()
@property (nonatomic, strong) id collection;
@end

@implementation CompletedCollectionViewDataSource

- (instancetype)initWithOperatorCollection:(CompletedCollection *)collection
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
