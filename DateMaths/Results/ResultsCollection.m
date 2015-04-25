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

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.data[idx];
}

- (void)addObject:(id<DataItem>)dataItem
{
    [self.data addObject:dataItem];
}

- (void)removeObject:(id<DataItem>)resultItem
{
    [self.data removeObject:resultItem];
}

- (NSNumber *)sum
{
    NSMutableArray *integers = [NSMutableArray array];
    for (id<DataItem> completed in self) {
        [integers addObject:completed.value];
    }

    NSString *format = [integers componentsJoinedByString:@""];
    if (!format.length) {
        return nil;
    }

    NSExpression *expression;
    @try {
        expression = [NSExpression expressionWithFormat:format];
    } @catch (NSException *exception) {
        return nil;
    }

    id value = [expression expressionValueWithObject:nil context:nil];

    return value;
}

@end
