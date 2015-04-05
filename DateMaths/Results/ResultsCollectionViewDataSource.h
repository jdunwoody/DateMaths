#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol DataItem;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (void)addItem:(id<DataItem>)item;

@end
