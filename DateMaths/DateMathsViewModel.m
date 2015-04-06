//
// Created by James Dunwoody on 29/03/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "DateMathsViewModel.h"


@interface DateMathsViewModel ()
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSDateFormatter *dateFormatter;
@end

@implementation DateMathsViewModel

- (instancetype)initWithDate:(NSDate *)date
{
    self = [super init];
    if (!self) {
        return self;
    }

    _dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = @"dd/MM/YYYY";

    _formattedDate = [self.dateFormatter stringFromDate:date];

    NSAssert(self.formattedDate.length > 0, @"No formatted date");

    return self;
}

@end
