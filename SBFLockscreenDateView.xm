#import "SBFLockScreenDateView.h"

// CGFloat alignmentPercent;
%hook SBFLockScreenDateView

//adds a property for batteryView
%property(nonatomic, retain) MLSBatteryIndicatorView *batteryView;

// sets the dateview horizontal alignment
- (void)setAlignmentPercent:(CGFloat)percent {
    // alignmentPercent = percent;

    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"]) {
        percent = [[MLSPrefsController sharedInstance] floatForKey:@"kMLSDateViewAlignmentX"];
    }
    %orig(percent);
}

// sets the batteryview alpha with the dateview alpha
- (void)setContentAlpha:(double)alpha withSubtitleVisible:(BOOL)subtitle {
    %orig(alpha, subtitle);

    if (self.batteryView) {
        [self.batteryView setAlpha:alpha];
    }
}

// sets the legebility settings color
- (void)setLegibilitySettings:(_UILegibilitySettings *)settings {
    [settings setPrimaryColor:[[MLSPrefsController sharedInstance] colorForKey:@"kMLSPrimaryLegibilityColor"]];
    %orig(settings);
}

// sets the dateview frame
// - (void)setFrame:(CGRect)frame {
//     if (alignmentPercent < 0) {
//         %orig(CGRectMake(frame.origin.x, 20, frame.size.width, frame.size.height));
//     } else {
//         %orig(frame);
//     }
// }

- (void)layoutSubviews {
    %orig;
    if ([[MLSPrefsController sharedInstance] boolForKey:@"kMLSEnabled"] && [[MLSPrefsController sharedInstance] boolForKey:@"kMLSDateViewBatteryEnabled"]) {
        // creates the batteryView
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