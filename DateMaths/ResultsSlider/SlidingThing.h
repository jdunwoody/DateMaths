//
//  SlidingThing.h
//  DateMaths
//
//  Created by James Dunwoody on 31/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SlidingThing : UIView

@property (nonatomic) CGFloat actualYPosition;
@property (nonatomic) CGFloat targetYPosition;

@end
