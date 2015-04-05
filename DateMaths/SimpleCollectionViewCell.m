//
//  SimpleCollectionViewCell.m
//  DateMaths
//
//  Created by James Dunwoody on 4/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "SimpleCollectionViewCell.h"

@implementation SimpleCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.label.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor whiteColor];
}

@end
