#import <Foundation/Foundation.h>
#import "IndexableCollection.h"

@protocol DataItem;
@protocol IndexableCollection;
@class Digit;
@class DigitFactory;

@interface DigitCollection : NSObject<IndexableCollection>

@property (nonatomic, readonly) int numUsed;
@property (nonatomic, readonly) int percentageUsed;

- (instancetype)init __unavailable;
- (instancetype)initWithDigitFactory:(DigitFactory *)digitFactory;

- (NSInteger)count;
- (Digit *)digitWithSymbol:(NSString *)symbol;

@end
