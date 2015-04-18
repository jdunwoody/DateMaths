//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "TargetCollectionViewDataSource.h"
#import "TargetCollection.h"
#import "SimpleCollectionViewCell.h"
#import "DataItem.h"
#import "TargetItem.h"

@interface TargetCollectionViewDataSource ()
@property (nonatomic, strong) TargetCollection *collection;
@end

@implementation TargetCollectionViewDataSource

- (instancetype)initWithOperatorCollection:(TargetCollection *)collection
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
    TargetItem *item = self.collection[(NSUInteger)indexPath.row];

    cell.label.text = item.value;
    cell.backgroundColor = self.collection.current == item ? [UIColor whiteColor] : [UIColor lightGrayColor];

    cell.starA.hidden = !item.starA;
    cell.starB.hidden = !item.starB;
    cell.starC.hidden = !item.starC;

    return cell;
}

@end
