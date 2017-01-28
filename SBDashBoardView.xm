#import "SBDashBoardView.h"

%hook SBDashBoardView

- (void)setDateViewIsVibrant: (BOOL)vibrant {
    %orig([[MLSPrefsController sharedInstance] boolForKey:@"kMLSDateViewIsVibrant"] ? YES : vibrant);
}

%end