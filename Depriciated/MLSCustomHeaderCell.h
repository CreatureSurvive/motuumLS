@interface UIView (Constraint)
- (NSLayoutConstraint *)_constraintForIdentifier:(id)arg1;
@end

@interface MLSCustomHeaderCell : UIView
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *subHeaderLabel;
@property (nonatomic, strong) UILabel *subHeaderLabel2;
@property (nonatomic, strong) UILabel *randomLabel;
@property (nonatomic, readonly) NSArray *randomTexts;
// @synthesize headerLabel, subHeaderLabel, subHeaderLabel2, randomLabel;
@end