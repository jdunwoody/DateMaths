//
// Created by James Dunwoody on 15/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ParserTestUtils.h"
#import "ParseItem.h"


@implementation ParserTestUtils

- (NSArray *)parseItemsFromString:(NSString *)expression
{
    NSMutableArray *parseItems = [NSMutableArray arrayWithCapacity:expression.length];

    for (int i = 0; i < expression.length; ++i) {
        [parseItems addObject:[[ParseItem alloc] initWithCharacter:[expression characterAtIndex:(NSUInteger)i]]];
    }

    return parseItems;
}

@end
