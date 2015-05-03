#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DigitCollection;
@class DateMathsViewController;
@protocol CollectionDataSourceDelegate;
@class LevelCollection;

@interface DigitCollectionDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithLevelCollection:(LevelCollection *)levelCollection withDelegate:(id<CollectionDataSourceDelegate>)delegate;

@end
