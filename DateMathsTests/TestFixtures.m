//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "TestFixtures.h"
#import "LevelCollection.h"
#import "DigitFactory.h"
#import "OperatorFactory.h"
#import "LevelItem.h"
#import "DigitCollection.h"
#import "ResultsCollection.h"
#import "OperatorCollection.h"

@implementation TestFixtures

+ (LevelCollection *)levelCollectionWithOperators:(NSArray *)operatorSymbols digits:(NSArray *)digitSymbols results:(NSArray *)resultSymbols
{
    DigitFactory *digitFactory = [[DigitFactory alloc] initWithDate:[NSDate date]];
    OperatorFactory *operatorFactory = [[OperatorFactory alloc] initWithSymbols:operatorSymbols];
    LevelCollection *levelCollection = [[LevelCollection alloc] initWithDigits:digitFactory.digits operatorFactory:operatorFactory];

    for (NSString *resultSymbol in resultSymbols) {
        Digit *digit = [levelCollection.current.digitCollection digitWithSymbol:resultSymbol];
        if (digit) {
            [levelCollection.current.resultsCollection addObject:(id<DataItem>)digit];
        } else {
            Operator *operator = [levelCollection.current.operatorCollection operatorWithSymbol:resultSymbol];
            [levelCollection.current.resultsCollection addObject:(id<DataItem>)operator];
        }
    }

    return levelCollection;
}

@end
