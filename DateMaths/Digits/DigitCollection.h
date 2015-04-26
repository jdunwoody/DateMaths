#import <Foundation/Foundation.h>
#import "IndexableCollection.h"
#import "KeyedCollection.h"

@protocol DataItem;
@protocol IndexableCollection;
@class Digit;
@class DigitFactory;

@protocol IndexedCollection;

@interface DigitCollection : NSObject<IndexableCollection, KeyedCollection>

@property (nonatomic, readonly) int numUsed;
@property (nonatomic, readonly) int percentageUsed;

- (instancetype)init __unavailable;
- (instancetype)initWithDigits:(NSArray *)digits;

- (NSInteger)count;
- (Digit *)digitWithSymbol:(NSString *)symbol;

@end
