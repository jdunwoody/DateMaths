#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Digit;
@protocol Item;

@interface ResultsCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (void)addItem:(id<Item>)item;

@end
