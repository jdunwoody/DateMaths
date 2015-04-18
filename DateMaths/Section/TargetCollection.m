//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "TargetCollection.h"
#import "TargetItem.h"


@interface TargetCollection ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation TargetCollection

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    NSMutableArray *mutableData = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 20; i++) {
        [mutableData addObject:[[TargetItem alloc] initWithNumber:i]];
    }

    _data = mutableData;
    _current = _data[0];

    return self;
}

- (NSInteger)count
{
    return self.data.count;
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.data[(NSUInteger)idx];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.data countByEnumeratingWithState:state objects:buffer count:len];
}

@end
