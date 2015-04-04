//
// Created by James Dunwoody on 4/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DigitCollectionDataSource.h"
#import "Item.h"
#import "Digit.h"
#import "DigitCollection.h"
#import "SimpleCollectionViewCell.h"

@interface DigitCollectionDataSource ()
@property (nonatomic, strong) DigitCollection *collection;
@end

@implementation DigitCollectionDataSource

- (instancetype)initWithDigitCollection:(DigitCollection *)collection
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.collection = collection;

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    Digit *digit = self.collection[(NSUInteger)indexPath.row];
    UILabel *label = [[UILabel alloc] init];
    cell.label = label;
    [cell.contentView addSubview:label];

    NSString *text = [NSString stringWithFormat:@"%li", (long)digit.digit];
    cell.label.text = text;
    cell.label.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];

    return cell;
}


@end
