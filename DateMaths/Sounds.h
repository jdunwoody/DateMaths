//
// Created by James Dunwoody on 4/05/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sounds : NSObject<AVAudioPlayerDelegate>

- (void)playSound;

- (void)playBackgroundMusic;
@end
