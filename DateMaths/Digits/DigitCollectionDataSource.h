#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DigitCollection;

@interface DigitCollectionDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init __unavailable;
- (instancetype)initWithDigitCollection:(DigitCollection *)collection;
@end
