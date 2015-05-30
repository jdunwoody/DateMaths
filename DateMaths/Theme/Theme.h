//
//  Theme.h
//  DateMaths
//
//  Created by James Dunwoody on 30/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Theme : NSObject

+ (UIFont *)fontWithSize:(int)fontSize;

+ (UIColor *)colourMain;
+ (UIColor *)colourBackgroundGradientTop;
+ (UIColor *)colourBackgroundGradientBottom;

+ (UIColor *)datedatePickerTextColor;
+ (UIColor *)deselectedColour;
@end
