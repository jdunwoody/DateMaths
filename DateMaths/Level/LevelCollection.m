//
// Created by James Dunwoody on 6/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "LevelCollection.h"
#import "LevelItem.h"
#import "DigitCollection.h"
#import "OperatorCollection.h"
#import "ResultsCollection.h"
#import "DigitFactory.h"
#import "OperatorFactory.h"


@interface LevelCollection ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation LevelCollection

- (instancetype)initWithDigits:(NSArray *)digits operatorFactory:(OperatorFactory *)operatorFactory
{
    self = [super init];
    if (!self) {
        return self;
    }

    NSMutableArray *mutableData = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 20; i++) {
        LevelItem *levelItem = [[LevelItem alloc] initWithNumber:i digits:digits operatorFactory:operatorFactory];

        [mutableData addObject:levelItem];
    }

    _data = mutableData;
    _current = _data[0];

    return self;
}

- (NSInteger)count
{
    return self.data.count;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.data[(NSUInteger)idx];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.data countByEnumeratingWithState:state objects:buffer count:len];
}

- (DigitCollection *)digits
{
    return self.current.digitCollection;
}

- (OperatorCollection *)operators
{
    return self.current.operatorCollection;
}

- (ResultsCollection *)results
{
    return self.current.resultsCollection;
}
@end
