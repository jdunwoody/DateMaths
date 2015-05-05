#import "Sounds.h"

@interface Sounds ()
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVAudioPlayer *backgroundAudioPlayer;
@end

@implementation Sounds

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    [self prepareAudio];

    return self;
}

#pragma mark - Play Sounds

- (void)playSoundEffect
{
    [self playFromBeginningWithPlayer:self.audioPlayer];
}

- (void)playBackgroundMusic
{
    [self playFromBeginningWithPlayer:self.backgroundAudioPlayer];
}

#pragma mark - Configure Audio

- (void)prepareAudio
{
    self.audioPlayer = [self buildAudioPlayer:@"marimba" ext:@"m4a"];
    self.backgroundAudioPlayer = [self buildAudioPlayer:@"background" ext:@"mp3"];

    self.audioPlayer.delegate = self;
    self.backgroundAudioPlayer.delegate = self;

    [self.audioPlayer prepareToPlay];
    [self.backgroundAudioPlayer prepareToPlay];
}

- (AVAudioPlayer *)buildAudioPlayer:(NSString *)name ext:(NSString *)ext
{
    NSError *error;
    NSURL *soundUrl = [[NSBundle mainBundle] URLForResource:name withExtension:ext];

    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
    NSAssert(error == nil, [error localizedDescription]);

    return audioPlayer;
}

- (void)playFromBeginningWithPlayer:(AVAudioPlayer *)audioPlayer
{
    audioPlayer.currentTime = 0.0;

    [audioPlayer play];
}

@end
