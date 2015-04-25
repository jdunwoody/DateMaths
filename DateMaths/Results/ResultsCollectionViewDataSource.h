#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol DataItem;
@class ResultsCollection;
@class LevelCollection;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithCollection:(LevelCollection *)collection;

- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (void)removeItem:(id<DataItem>)resultItem;
@end
