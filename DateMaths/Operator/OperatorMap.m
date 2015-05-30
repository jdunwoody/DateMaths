//
// Created by James Dunwoody on 7/05/15.
//

#import "OperatorMap.h"


@interface OperatorMap ()
@property (nonatomic, readonly) NSDictionary *mapping;
@end

@implementation OperatorMap

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    _mapping = @{
        @"/" : @"%",
        @"*" : @"x",
    };

    return self;
}

- (id)objectForKeyedSubscript:(id)key
{
    return self.mapping[key] == nil ? key : self.mapping[key];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained[])buffer count:(NSUInteger)len
{
    return [self.mapping count];
}

@end
