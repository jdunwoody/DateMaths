//
// Created by James Dunwoody on 7/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "Parser.h"


@interface Parser ()
@property (nonatomic, readonly) NSArray *strings;
@property (nonatomic) NSUInteger currentIndex;
@end

@implementation Parser

- (instancetype)initWithDataItems:(NSArray *)strings
{
    self = [super init];
    if (!self) {
        return self;
    }

    _strings = strings;
    _currentIndex = 0;

    return self;
}

- (void)parse
{
    [self parseWithTotal:0];
}

- (int)parseWithTotal:(int)total
{
    unichar c = [self next];

    if (!c) {
        return total;
    }

    int rhs;

    switch (c) {
        case '+':
            NSAssert(total, @"missing LHS number for operator +");
            rhs = [self parseWithTotal:0];
            NSAssert(rhs, @"missing LHS number for operator +");

            total += rhs;
            break;
        case '-':
            [self sub:c];
            break;
        case '*':
            [self mult:c];
            break;
        case '%':
            [self div:c];
            break;
        case '(':
            [self openParen:c];
            break;
        case ')':
            [self closeParen:c];
            break;
        default: {
            int num = [self number:c];
            total *= 10;
            total += num;
            rhs = [self parseWithTotal:total];
            break;
        }
    }
    return total;
}

- (int)number:(unichar)c
{
    return (int)c - (int)'0';
}

- (void)closeParen:(unichar)c
{

}

- (void)openParen:(unichar)c
{

}

- (void)div:(unichar)c
{

}

- (void)mult:(unichar)c
{

}

- (void)sub:(unichar)c
{

}

- (void)add:(unichar)c
{

}

- (unichar)next
{
    return [self.strings[self.currentIndex++] characterAtIndex:0];
}

@end
