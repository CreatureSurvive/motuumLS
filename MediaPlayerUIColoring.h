#import "3rdParty/CreatureUtils.h"
#import "MLSPrefsController.h"

@interface _MPUDetailSlider : UISlider {
    UIView *_magnifiedThumbView;
}
@end

@interface MPUHalfTintedTransportButton : UIButton
- (BOOL)isLockScreenMediaControlButton;
- (void)setRegularImageColor:(UIColor *)color;
@end

@interface MPUTransportButton : UIButton
- (void)setTransportButtonImageViewContentMode:(long long)arg1;
- (BOOL)isLockScreenMediaControlButton;
- (void)setRegularColor:(UIColor *)color;
- (id)regularColor;
- (void)setTransportButtonImage:(UIImage *)image;
@end

@interface MPUSystemMediaControlsView : UIView
- (UIView *)volumeView;
- (id)initWithFrame:(CGRect)arg1;
- (void)layoutSubviews;
- (int)style;
- (id)initWithStyle:(int)style;
- (UIView *)transportControlsView;
- (UIView *)timeInformationView;
- (UIView *)trackInformationView;
- (void)updatePlaybackState:(BOOL)arg1;
- (void)_layoutSubviewsControlCenteriPad;
- (void)setTransportControlsView:(id)arg1;
- (void)setTimeInformationView:(id)arg1;
- (void)setTrackInformationView:(id)arg1;
- (void)setVolumeView:(id)arg1;
- (UIImage *)tintImage:(UIImage *)image withColor:(UIColor *)color;
@end

@interface MPUNowPlayingTitlesView : UIView {

}
- (BOOL)isExplicit;
- (id)initWithFrame:(CGRect)arg1;
- (void)layoutSubviews;
- (CGSize)sizeThatFits:(CGSize)arg1;
- (int)style;
- (id)titleTextAttributes;
- (void)setTitleTextAttributes:(id)arg1;
- (id)_titleLabel;
- (id)initWithStyle:(int)arg1;
- (void)setMarqueeEnabled:(BOOL)arg1;
- (void)setTitleText:(id)arg1;
- (BOOL)isMarqueeEnabled;
- (id)detailTextAttributes;
- (float)textMargin;
- (id)explicitImage;
- (void)setExplicitImage:(id)arg1;
- (void)setTextMargin:(float)arg1;
- (void)setArtistText:(id)arg1;
- (float)titleBaselineOffsetFromBottom;
- (void)setMarqueeEnabled:(BOOL)arg1 allowCurrentMarqueeToFinish:(BOOL)arg2;
- (void)setExplicit:(BOOL)arg1;
- (void)setAlbumText:(id)arg1;
- (void)setDetailTextAttributes:(id)arg1;
- (void)resetMarqueePositions;
- (id)artistText;
- (id)albumText;
- (id)stationNameText;
- (id)_detailLabel;
- (id)titleText;
- (long long)mediaControlsStyle;
@end

@interface MPUMediaControlsVolumeView : UIView
- (void)layoutSubviews;
- (id)slider;
- (int)style;
@end

@interface MPUTransportControlsView : UIView
- (BOOL)isLockScreenMediaSectionAndEnabled;
@end
@interface MPUChronologicalProgressView : UIView
- (long long)style;
- (void)layoutSubviews;
@end

@interface MPUNowPlayingController : NSObject
@property (nonatomic, readonly) NSDictionary *currentNowPlayingInfo;
@end

@interface MPUSystemMediaControlsViewController : UIViewController {
    MPUNowPlayingController *_nowPlayingController;
}
- (id)_imageForTransportButtonWithControlType:(long long)arg1;
@end

@interface MPUTransportControl : NSObject
@property (nonatomic, readonly) long long type;
- (id)initWithType:(long long)arg1 group:(int)arg2;
@end