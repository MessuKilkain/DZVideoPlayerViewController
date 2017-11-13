//
//  DZVideoPlayerUiProtocol.h
//

#ifndef DZVideoPlayerUiProtocol_h
#define DZVideoPlayerUiProtocol_h

#import "DZPlayerView.h"
#import "DZProgressIndicatorSlider.h"

@protocol DZVideoPlayerUiProtocol

-(DZPlayerView *)playerView;

-(UIActivityIndicatorView *)activityIndicatorView;

-(UIView *)topToolbarView;
-(UIView *)bottomToolbarView;
-(UIButton *)doneButton;
-(UIButton *)playButton;
-(UIButton *)pauseButton;
-(DZProgressIndicatorSlider *)progressIndicator;
-(UILabel *)currentTimeLabel;
-(UILabel *)remainingTimeLabel;
-(UIButton *)fullscreenExpandButton;
-(UIButton *)fullscreenShrinkButton;

@end

#endif /* DZVideoPlayerUiProtocol_h */
