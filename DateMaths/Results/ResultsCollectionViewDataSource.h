#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol DataItem;
@class ResultsCollection;
@class LevelCollection;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithLevelCollection:(LevelCollection *)levelCollection;

- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (void)removeItem:(id<DataItem>)resultItem;
@end
