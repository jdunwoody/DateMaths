#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol DataItem;
@class ResultsCollection;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithCollection:(ResultsCollection *)collection;

- (void)addItem:(id<DataItem>)item;
- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (void)removeItem:(id<DataItem>)resultItem;
@end
