//
// Created by James Dunwoody on 3/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "OperatorCollection.h"
#import "Operator.h"


@interface OperatorCollection ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation OperatorCollection

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    self.data = @[
        [[Operator alloc] initWithSymbol:@"+"],
        [[Operator alloc] initWithSymbol:@"-"],
        [[Operator alloc] initWithSymbol:@"*"],
        [[Operator alloc] initWithSymbol:@"%"],
        [[Operator alloc] initWithSymbol:@"("],
        [[Operator alloc] initWithSymbol:@")"],
    ];

    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.data countByEnumeratingWithState:state objects:buffer count:len];
}

@end
