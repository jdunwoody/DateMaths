//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ResultsCollection.h"
#import "DataItem.h"
#import "Digit.h"


@interface ResultsCollection ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ResultsCollection

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.data = [[NSMutableArray alloc] init];

    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.data countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSInteger)count
{
    return [self.data count];
}

- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    return self.data[(NSUInteger)idx];
}

- (void)addObject:(id<DataItem>)dataItem
{
    [self.data addObject:dataItem];
}

- (void)removeObject:(id<DataItem>)resultItem
{
    [self.data removeObject:resultItem];
}

- (NSInteger)sum
{
    int sum = 0;

    for (id<DataItem> dataItem in self.data) {
        if ([dataItem isKindOfClass:[Digit class]]) {
            Digit *digit = dataItem;
            sum += digit.digit;

        } else {

        }
    }

    return sum;
}

@end
