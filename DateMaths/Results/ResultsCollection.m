//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ResultsCollection.h"
#import "DataItem.h"


@interface ResultsCollection ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation ResultsCollection

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.items = [[NSMutableArray alloc] init];

    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.items countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSInteger)count
{
    return [self.items count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.items[idx];
}

- (id)objectForKeyedSubscript:(id)key
{
    for (id<DataItem> item in self.items) {
        if (item == key) {
            return item;
        }
    }

    return nil;
}

- (void)addObject:(id<DataItem>)dataItem
{
    [self.items addObject:dataItem];
}

- (void)removeObject:(id<DataItem>)resultItem
{
    [self.items removeObject:resultItem];
}

- (NSNumber *)sum
{
    NSMutableArray *dataItems = [NSMutableArray array];
    for (id<DataItem> completed in self) {
        [dataItems addObject:completed.value];
    }

    NSString *format = [dataItems componentsJoinedByString:@""];
    if (!format.length) {
        return nil;
    }

    NSExpression *expression;
    @try {
        expression = [NSExpression expressionWithFormat:format];
    }
    @catch (NSException *exception) {
        return nil;
    }

    id value = [expression expressionValueWithObject:nil context:nil];

    if (dataItems.count == 0) {
        value = @0;
    }

    return value;
}

- (void)moveDataItem:(id<DataItem>)dataItem toDataItem:(id<DataItem>)item
{
    NSUInteger indexOfObject = [self.items indexOfObject:item];
    [self.items removeObject:dataItem];
    [self.items insertObject:dataItem atIndex:indexOfObject];
}

@end
