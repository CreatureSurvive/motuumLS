#import "SBDashBoardMainPageView.h"

%hook SBDashBoardMainPageView
// disables the press to unlock lable on the lockscreen
- (void)_layoutCallToActionLabel {
    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"]) {
        if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSCallToActionLabelDisabled"]) {
            return;
        }
    }
    %orig;
}

// disables the press to unlock lable on the lockscreen
- (SBUICallToActionLabel *)callToActionLabel {
    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"]) {
        if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSCallToActionLabelDisabled"]) {
            return nil;
        }
    }
    return %orig;
}

%end