//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorCollection.h"
#import "Operator.h"


@interface OperatorCollection ()
@property (nonatomic, strong, readonly) NSArray *data;
@end

@implementation OperatorCollection

- (instancetype)initWithOperators:(NSArray *)operators
{
    self = [super init];
    if (!self) {
        return self;
    }

    _data = operators;

    return self;
}

- (NSInteger)count
{
    return [self.data count];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.data countByEnumeratingWithState:state objects:buffer count:len];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.data[(NSUInteger)idx];
}

- (Operator *)operatorWithSymbol:(NSString *)symbol
{
    for (Operator *operator in self.data) {
        if ([operator.symbol isEqualToString:symbol]) {
            return operator;
        }
    }

    return nil;
}
@end
