//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DateMathsViewModel : NSObject
@property (nonatomic, readonly) NSString *formattedDate;

- (instancetype)init __unavailable;
- (instancetype)initWithDate:(NSDate *)date;

@end
