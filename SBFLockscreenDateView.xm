#import "SBFLockScreenDateView.h"

%hook SBFLockScreenDateView

// %property(nonatomic, retain) SBLockScreenBatteryFillView *batteryView;
%property(nonatomic, retain) MLSBatteryIndicatorView *batteryView;


- (void)setAlignmentPercent:(CGFloat)percent {
    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"]) {
        percent = [[MLSPrefsController sharedInstance] floatForKey:@"kMLSDateViewAlignmentX"];
    }
    %orig(percent);
}

- (void)setContentAlpha:(double)alpha withSubtitleVisible:(BOOL)subtitle {
    %orig(alpha, subtitle);

    if (self.batteryView) {
        [self.batteryView setAlpha:alpha];
    }
}

// - (_UILegibilitySettings *)legibilitySettings {
//     _UILegibilitySettings *settings = %orig;
//     [settings setPrimaryColor:[UIColor cyanColor]];

//     return settings;
// }

// - (void)setLegibilitySettings:(_UILegibilitySettings *)settings {
//     [settings setPrimaryColor:[UIColor cyanColor]];
//     %orig(settings);
// }

// - (id)initWithFrame:(CGRect)frame {
//     self = %orig;
//     // [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];

//     return self;
// }

- (void)layoutSubviews {
    %orig;
    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"] && [[MLSPrefsController sharedInstance] boolForKey:@"kMLSDateViewBatteryEnabled"]) {
        if (!self.batteryView) {
            // self.batteryView = [[SBLockScreenBatteryFillView alloc] initWithFrame:CGRectMake(0, 25, 55, 100) isInternalBattery:YES lowBatteryLevel:20];
            self.batteryView = [[MLSBatteryIndicatorView alloc] initWithFrame:CGRectMake(
                                    (self.bounds.size.width - (self.bounds.size.height * 0.35)) * [[MLSPrefsController sharedInstance] floatForKey:@"kMLSDateViewBatteryAlignmentX"],
                                    25,
                                    (self.bounds.size.height * 0.35),
                                    (self.bounds.size.height - 30)
                                    )];

            [self insertSubview:self.batteryView atIndex:0];
        } else {
            [self.batteryView batteryLevelUpdate];
        }
    }
}

%end