//
// Created by Dana Buehre on 1/21/17.
// Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/NSObjCRuntime.h>
#import "MLSPrefsController.h"

@interface MLSBatteryIndicatorView : UIView
@property (nonatomic, retain) UIImageView *batteryChargingView;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)batteryLevelUpdate;
- (float)batteryLevel;
- (UIImage *)imageForBatteryLevel;
// - (void)dealloc;
@end

