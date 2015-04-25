//
// Created by James Dunwoody on 20/04/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LevelCollection;


@interface TestFixtures : NSObject

+ (LevelCollection *)levelCollectionWithOperators:(NSArray *)operatorSymbols digits:(NSArray *)digitSymbols results:(NSArray *)resultSymbols;

@end
