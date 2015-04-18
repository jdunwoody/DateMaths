#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DigitCollection;
@class DateMathsViewController;
@protocol CollectionDataSourceDelegate;
@class LevelCollection;

@interface DigitCollectionDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithCollection:(LevelCollection *)collection withDelegate:(id<CollectionDataSourceDelegate>)delegate;

@end
