//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DigitCollectionDataSource.h"
#import "DataItem.h"
#import "Digit.h"
#import "DigitCollection.h"
#import "SimpleCollectionViewCell.h"
#import "CollectionDataSourceDelegate.h"
#import "LevelCollection.h"

@interface DigitCollectionDataSource ()
@property (nonatomic, strong) LevelCollection *collection;
@property (nonatomic, readonly) id<CollectionDataSourceDelegate> delegate;
@end

@implementation DigitCollectionDataSource

- (instancetype)initWithCollection:(LevelCollection *)collection withDelegate:(id<CollectionDataSourceDelegate>)delegate
{
    self = [super init];
    if (!self) {
        return self;
    }

    _delegate = delegate;
    _collection = collection;

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collection.digits count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    Digit *digit = self.collection.digits[(NSUInteger)indexPath.row];
    cell.label.text = digit.value;

    if (digit.used) {
        cell.backgroundColor = [UIColor grayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }

    [self.delegate didLayoutCell:indexPath inCollectionView:collectionView];

    return cell;
}

@end
