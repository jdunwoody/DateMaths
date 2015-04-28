//
//  DragResultsMovingDynamicBehaviour.h
//  DateMaths
//
//  Created by James Dunwoody on 26/04/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragResultsMovingDynamicBehaviour : UIDynamicBehavior

@property (nonatomic) CGPoint targetPoint;
@property (nonatomic) CGPoint velocity;

- (instancetype)initWithItem:(id<UIDynamicItem>)item;

@end
