#import "SBDashBoardViewControllerBase.h"

%hook SBDashBoardViewControllerBase

// -(void)viewDidLayoutSubviews {
//     %orig;
//     [self.legibilitySettings setPrimaryColor:[UIColor cyanColor]];
// }

- (void)viewWillDisappear: (BOOL)value {
    %orig;
    [self.legibilitySettings setPrimaryColor:[UIColor whiteColor]];
}

%end