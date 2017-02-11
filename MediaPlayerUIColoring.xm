#import "MediaPlayerUIColoring.h"
/////////////////////////////////// MPUTransportButton ///////////////////////////////////
%hook MPUTransportButton
- (void)setRegularColor: (id)color {

    MLSPrefsController *prefsController = [MLSPrefsController sharedInstance];

    if ([prefsController boolForKey:@"kMLSEnabled"]) {
        color = [prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"];
    }
    %orig(color);
}

%end

/////////////////////////////////// MPUMediaControlsVolumeView ///////////////////////////////////
%hook MPUMediaControlsVolumeView
- (void)layoutSubviews {
    %orig;

    MLSPrefsController *prefsController = [MLSPrefsController sharedInstance];

    if ([prefsController boolForKey:@"kMLSEnabled"]) {

        if (self.style == 5) {
            if ([self.slider currentThumbImage]) {
                [self.slider setThumbImage:[[CreatureUtils sharedInstance] tintImage:[self.slider currentThumbImage]
                                                                           withColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]]
                                  forState:UIControlStateNormal];
            } else {
                [self.slider setThumbTintColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]];
            }
            [self.slider setMinimumTrackTintColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]];
            [self.slider setMaximumTrackTintColor:[prefsController colorForKey:@"kMLSMediaControlsSecondaryColor"]];
        }
    }
}
%end

/////////////////////////////////// MPUNowPlayingTitlesView ///////////////////////////////////
%hook MPUNowPlayingTitlesView
- (void)layoutSubviews {
    %orig;

    MLSPrefsController *prefsController = [MLSPrefsController sharedInstance];

    if ([prefsController boolForKey:@"kMLSEnabled"]) {

        if ([self mediaControlsStyle] == 5) {

            self.titleTextAttributes = @{NSForegroundColorAttributeName:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]};
            self.detailTextAttributes = @{NSForegroundColorAttributeName:[prefsController colorForKey:@"kMLSMediaControlsSecondaryColor"]};
        }
    }
}
%end

/////////////////////////////////// MPUChronologicalProgressView ///////////////////////////////////
%hook MPUChronologicalProgressView
- (void)layoutSubviews {
    %orig;

    MLSPrefsController *prefsController = [MLSPrefsController sharedInstance];

    if ([prefsController boolForKey:@"kMLSEnabled"]) {

        if ([self style] == 5) {

            _MPUDetailSlider *slider = (_MPUDetailSlider *)[self subviews][0];
            if ([slider currentThumbImage]) {
                [slider setThumbImage:[[CreatureUtils sharedInstance] tintImage:[slider currentThumbImage]
                                                                      withColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]]
                             forState:UIControlStateNormal];
            } else {
                [slider setThumbTintColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]];
            }
            [MSHookIvar<UIView *>(slider, "_magnifiedThumbView") setBackgroundColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]];
            [slider setMinimumTrackTintColor:[prefsController colorForKey:@"kMLSMediaControlsPrimaryColor"]];
            [slider setMaximumTrackTintColor:[prefsController colorForKey:@"kMLSMediaControlsSecondaryColor"]];

            UILabel *currentTimeLabel = (UILabel *)[self subviews][1];
            [currentTimeLabel setTextColor:[prefsController colorForKey:@"kMLSMediaControlsSecondaryColor"]];

            UILabel *remainingTimeLabel = (UILabel *)[self subviews][2];
            [remainingTimeLabel setTextColor:[prefsController colorForKey:@"kMLSMediaControlsSecondaryColor"]];
        }
    }
}

%end
