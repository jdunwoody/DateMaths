//
// Created by James Dunwoody on 8/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ParseItem.h"


@interface ParseItem ()
@property (nonatomic, readonly) unichar character;
@end

@implementation ParseItem

- (instancetype)initWithCharacter:(unichar)character
{
    self = [super init];
    if (!self) {
        return self;
    }

    _character = character;

    return self;
}

- (BOOL)isPlus
{
    return self.character == '+';
}

- (BOOL)isMinus
{
    return self.character == '-';
}

- (BOOL)isMulti
{
    return self.character == '*';
}

- (BOOL)isDivide
{
    return self.character == '/';
}

- (BOOL)isOpenParen
{
    return self.character == '(';
}

- (BOOL)isCloseParen
{
    return self.character == ')';
}

- (BOOL)isDigit
{
    BOOL withinMinimum = (int)self.character >= '0';
    BOOL withinMaximum = (int)self.character <= '9';

    return withinMinimum && withinMaximum;
}

- (double)digit
{
    return self.character - (int)('0');
}
@end
