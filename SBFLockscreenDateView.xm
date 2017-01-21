#import "SBFLockScreenDateView.h"

%hook SBFLockScreenDateView

%property(nonatomic, retain) SBLockScreenBatteryFillView *batteryView;

- (void)setAlignmentPercent:(CGFloat)percent {
    %orig(1);
}

- (_UILegibilitySettings *)legibilitySettings {
    _UILegibilitySettings *settings = %orig;
    [settings setPrimaryColor:[UIColor cyanColor]];

    return settings;
}

- (void)setLegibilitySettings:(_UILegibilitySettings *)settings {
    [settings setPrimaryColor:[UIColor cyanColor]];
    %orig(settings);
}

- (id)initWithFrame:(CGRect)frame {
    self = %orig;
    self.batteryView = [[SBLockScreenBatteryFillView alloc] initWithFrame:CGRectMake(20, 20, 80, 120) isInternalBattery:YES lowBatteryLevel:20];
    [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];
    [self insertSubview:self.batteryView atIndex:0];

    return self;
}

- (void)layoutSubviews {
    %orig;
    // [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];
}

%end