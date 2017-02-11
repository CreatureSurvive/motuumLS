//
//  CreatureUtils.h
//  CreatureUtils
//
//  Created by Dana Buehre on 2/10/17.
//  Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CreatureUtils : NSObject
+ (instancetype)sharedInstance;


//image utilities
+ (UIImage *)imageWithView:(UIView *)view;
- (UIImage *)tintImage:(UIImage *)image withColor:(UIColor *)color;
@end
