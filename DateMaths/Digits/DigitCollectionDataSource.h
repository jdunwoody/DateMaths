#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DigitCollection;
@class DateMathsViewController;
@protocol CollectionDataSourceDelegate;

@interface DigitCollectionDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithDigitCollection:(DigitCollection *)collection withDelegate:(id<CollectionDataSourceDelegate>)delegate;

@end
