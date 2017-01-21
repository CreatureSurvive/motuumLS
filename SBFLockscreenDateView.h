@interface SBLockScreenBatteryFillView : UIView {

    long long _chargePercentage;
    long long _lowBatteryLevel;
    BOOL _isInternalBattery;

}
- (id)initWithFrame:(CGRect)arg1 isInternalBattery:(BOOL)arg2 lowBatteryLevel:(long long)arg3;
- (void)setChargePercentage:(long long)arg1;
- (void)drawRect:(CGRect)arg1;
@end

@interface SBUILegibilityLabel : UIView
@property (nonatomic, copy) UIColor *textColor;
@end

@interface _UILegibilitySettings : NSObject
@property (nonatomic, retain) UIColor *primaryColor;
@property (nonatomic, retain) UIColor *secondaryColor;
@property (nonatomic, retain) UIColor *shadowColor;
@property (nonatomic, retain) UIColor *contentColor;
@property (assign, nonatomic) double shadowRadius;
@property (assign, nonatomic) double shadowAlpha;
@property (assign, nonatomic) double imageOutset;
@property (assign, nonatomic) double minFillHeight;
@end

@interface SBFLockScreenDateView : UIView {
    SBUILegibilityLabel *_timeLabel;
}
@property (assign, nonatomic) double alignmentPercent;
@property (nonatomic, retain) _UILegibilitySettings *legibilitySettings;
- (void)setLegibilitySettings:(_UILegibilitySettings *)settings;
- (void)setTextColor:(UIColor *)color;
- (void)_updateLabels;
@end

@interface SBFLockScreenDateView (MLS)
@property (nonatomic, retain) SBLockScreenBatteryFillView *batteryView;
@end