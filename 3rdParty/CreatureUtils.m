//
//  CreatureUtils.m
//  CreatureUtils
//
//  Created by Dana Buehre on 2/10/17.
//  Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#import "CreatureUtils.h"

@implementation CreatureUtils
// a static instance of CreaturUtils
+ (instancetype)sharedInstance {
    static CreatureUtils *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[CreatureUtils alloc] init];
    });

    return sharedInstance;
}

- (UIImage *)tintImage:(UIImage *)image withColor:(UIColor *)color {

    UIImageView *view = [[UIImageView alloc] initWithImage:image];
    [view setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [view setTintColor:color];

    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return img;
}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];

    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return img;
}

@end
