//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorCollectionDataSource.h"
#import "OperatorCollection.h"
#import "SimpleCollectionViewCell.h"
#import "Item.h"


@interface OperatorCollectionDataSource ()
@property (nonatomic, readonly) OperatorCollection *collection;
@end

@implementation OperatorCollectionDataSource

- (instancetype)initWithOperatorCollection:(OperatorCollection *)collection
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
    id<Item> item = self.collection[(NSUInteger)indexPath.row];

    cell.label.text =  item.value;
    cell.backgroundColor = [UIColor whiteColor];
    cell.label.textColor = [UIColor blackColor];

    return cell;
}

@end
