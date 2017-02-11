#import "SBDashBoardView.h"

%hook SBDashBoardView

// sets the date and time vibrant
- (void)setDateViewIsVibrant: (BOOL)vibrant {
    %orig([[MLSPrefsController sharedInstance] boolForKey:@"kMLSDateViewIsVibrant"] ? YES : vibrant);
}

%end