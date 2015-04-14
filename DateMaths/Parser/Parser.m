#import "Parser.h"
#import "ParseItem.h"

@interface Parser ()
@property (nonatomic, readonly) NSArray *parseItems;
@property (nonatomic) NSUInteger currentIndex;
@property (nonatomic, readonly) BOOL hasNext;
@end

/**
* <expression> ::= <term> | <term> "+" <expression>
* <term>       ::= <factor> | <term> "*" <factor>
* <factor>     ::= <digit>  | "(" <expression> ")"
* <digit>      ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
*/

/**
* <expression> ::= <term> | <term> "+" <expression>
* <term>       ::= <factor> | <factor> "*" <term>
* <factor>     ::= <digit>  | "(" <expression> ")"
* <digit>      ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
*/

@implementation Parser

- (instancetype)initWithParseItems:(NSArray *)parseItems
{
    self = [super init];
    if (!self) {
        return self;
    }

    _parseItems = parseItems;
    _currentIndex = 0;

    return self;
}

/**
* <expression> ::= <term> | <term> "+" <expression>
*/
- (double)expression
{
    double result = [self term];

    if (self.hasNext) {
        ParseItem *operator = [self next];

        if (operator.isPlus) {
            [self advance];
            result = result + [self expression];

        } else if (operator.isMinus) {
            [self advance];
            result = result - [self expression];

        }
    }

    return result;
}

/**
* <term>       ::= <factor> | <term> "*" <factor>
*/

- (double)term
{
    double result = [self factor];

    ParseItem *operator = [self next];

    if (operator.isMulti) {
        [self advance];
        result = result * [self term];

    } else if (operator.isDivide) {
        [self advance];
        result = result / [self term];

    }

    return result;
}

/**
* <factor> ::= "(" <expression> ")" | <digit>
*/

- (double)factor
{
    double result;

    ParseItem *parseItem = [self next];
    if (parseItem.isOpenParen) {
        [self advance];

        result = [self expression];

        if ([self next].isCloseParen) {
            [self advance];
        } else {
            NSAssert(false, @"Expected operator )");
        }
    } else {
        result = [self digit];
    }

    return result;
}

- (BOOL)isOperator
{
    ParseItem *parseItem = [self next];
    return parseItem.isOperator;
}

- (BOOL)isFactor
{
    ParseItem *parseItem = [self next];
    return parseItem.isOpenParen || [self next].isDigit;
}

/**
* <digit>      ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
*/

- (double)digit
{
    if (![self next].isDigit) {
        NSAssert(false, @"Expected digit");
    }

    double number = [self next].digit;
    [self advance];

    while ([self next].isDigit) {
        number *= 10;
        number += [self next].digit;

        [self advance];
    }

    return number;
}

- (BOOL)hasNext
{
    return self.currentIndex < self.parseItems.count;
}

- (int)number:(unichar)c
{
    return (int)c - (int)'0';
}

- (ParseItem *)next
{
    if (!self.hasNext) {
        return nil;
    }

    ParseItem *dataItem = self.parseItems[self.currentIndex];
    return dataItem;
}

- (void)advance
{
    self.currentIndex++;
}

@end
