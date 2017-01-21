//
// Created by Dana Buehre on 1/21/17.
// Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#include "MLSBatteryIndicatorView.h"

@implementation MLSBatteryIndicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //// enable battery monitoring
        // [[UIDevice currentDevice] setBatteryMonitoringEnabled: YES];

        //// steup the charging image
        self.batteryChargingView = [[UIImageView alloc] initWithImage:self.imageForBatteryLevel];
        [self insertSubview: self.batteryChargingView atIndex : 0];

        //// register for battery state notifications
//         [[NSNotificationCenter defaultCenter] addObserver: self
// selector: @selector(batteryLevelUpdate)
// name:    UIDeviceBatteryLevelDidChangeNotification
// object:  nil];
    }
    return self;
}

- (void)batteryLevelUpdate {

    self.batteryChargingView.image = self.imageForBatteryLevel;
}

- (float)batteryLevel {

    // UIDevice *device = [UIDevice currentDevice];
    float level = [[UIDevice currentDevice] batteryLevel];
    return level;
}

- (UIImage *)imageForBatteryLevel {

    float level = [self batteryLevel];
    CGSize batteryTipSize = CGSizeMake(self.bounds.size.width * 0.371428571429, self.bounds.size.height * 0.0540540540541);

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    //// Color Declarations
    UIColor *fillColor = (level > 0.2) ? [UIColor colorWithRed : 0 green : 1 blue : 0 alpha:0.55] : [UIColor colorWithRed : 1 green: 0.633 blue : 0 alpha: 0.55];
    UIColor *bgColor = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 0.45];

    //// Rect Declarations
    CGRect bounds = self.bounds;
    CGRect bgRect = CGRectMake(0, batteryTipSize.height, bounds.size.width, (bounds.size.height - batteryTipSize.height));
    CGRect bgTip = CGRectMake((bounds.size.width / 2) - (batteryTipSize.width / 2), 0, batteryTipSize.width, batteryTipSize.height - 1);
    CGRect fill = CGRectMake(0, bounds.size.height -  (bounds.size.height - batteryTipSize.height) * level, (bounds.size.width), (bounds.size.height - batteryTipSize.height) * level);

    //// batteryChargingBackground Drawing
    UIBezierPath *batteryChargingBackgroundPath = [UIBezierPath bezierPathWithRoundedRect: bgRect cornerRadius:5];
    [bgColor setFill];
    [batteryChargingBackgroundPath fill];


    //// batteryChargingViewBackgroundTip Drawing
    UIBezierPath *batteryChargingViewBackgroundTipPath = [UIBezierPath bezierPathWithRoundedRect: bgTip byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(batteryTipSize.height/2, batteryTipSize.height/2)];
    [batteryChargingViewBackgroundTipPath closePath];
    [bgColor setFill];
    [batteryChargingViewBackgroundTipPath fill];


    //// batteryChargingViewFill Drawing
    UIBezierPath *batteryChargingViewFillPath = [UIBezierPath bezierPathWithRoundedRect: fill cornerRadius: 5];
    [fillColor setFill];
    [batteryChargingViewFillPath fill];

    UIImage *batteryImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return batteryImage;
}

// - (void)dealloc {
//     [[NSNotificationCenter defaultCenter] removeObserver: self];
// }
@end