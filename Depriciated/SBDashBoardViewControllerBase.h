
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

@interface SBDashBoardViewControllerBase : UIViewController
@property (nonatomic, readonly) _UILegibilitySettings *legibilitySettings;
- (void)viewWillDisappear:(BOOL)value;
@end
