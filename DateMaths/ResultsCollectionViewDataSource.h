#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol Cell;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (void)addDigit:(id<Cell>)digit;

@end
