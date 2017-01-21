#import "SBFLockScreenDateView.h"

%hook SBFLockScreenDateView

// %property(nonatomic, retain) SBLockScreenBatteryFillView *batteryView;

- (void)setAlignmentPercent: (CGFloat)percent {
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
    // SBLockScreenBatteryFillView *batteryView = [[SBLockScreenBatteryFillView alloc] initWithFrame:CGRectMake(20, 20, 80, 120) isInternalBattery:YES lowBatteryLevel:20];
    [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];
    // [self insertSubview:batteryView atIndex:0];

    // make the battery view
    UIView *backgroundImg = [[UIView alloc] initWithFrame:CGRectMake(18, 18, 84, 104)];
    UIView *fillView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 80, 100)];

    backgroundImg.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.45];
    fillView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0.1 alpha:0.75];

    backgroundImg.layer.cornerRadius = 7;
    fillView.layer.cornerRadius = 7;

    backgroundImg.clipsToBounds = YES;
    fillView.clipsToBounds = YES;

    [self insertSubview:fillView atIndex:0];
    [self insertSubview:backgroundImg atIndex:0];

    return self;
}

- (void)layoutSubviews {
    %orig;
    // [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];
}

%end