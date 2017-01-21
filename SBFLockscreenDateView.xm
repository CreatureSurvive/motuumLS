#import "SBFLockScreenDateView.h"

%hook SBFLockScreenDateView

// %property(nonatomic, retain) SBLockScreenBatteryFillView *batteryView;
%property(nonatomic, retain) MLSBatteryIndicatorView *batteryView;


- (void)setAlignmentPercent:(CGFloat)percent {
    %orig(1);
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

- (id)initWithFrame:(CGRect)frame {
    self = %orig;
    // [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];

    return self;
}

- (void)layoutSubviews {
    %orig;

    if (!self.batteryView) {
        // self.batteryView = [[SBLockScreenBatteryFillView alloc] initWithFrame:CGRectMake(0, 25, 55, 100) isInternalBattery:YES lowBatteryLevel:20];
        self.batteryView = [[MLSBatteryIndicatorView alloc] initWithFrame:CGRectMake(0, 25, (self.bounds.size.height * 0.35), (self.bounds.size.height - 30))];

        [self insertSubview:self.batteryView atIndex:0];
    } else {
        [self.batteryView batteryLevelUpdate];
    }
}

%end