//
// Created by Dana Buehre on 1/22/17.
// Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#include "MLSPrefsController.h"

@implementation MLSPrefsController
+ (instancetype)sharedInstance {

    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;

}

- (void)LoadPreferences {

    self.preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:_plistfile];

    if (self.preferences == nil) {
        [self resetPreferences];
    }
}

- (void)resetPreferences {
    [self setPreferences:[NSMutableDictionary
                          dictionaryWithDictionary:@{
                              @"kMLSEnabled" :@"YES",
                              @"kMLSDateViewBatteryEnabled" :@"YES",
                              @"kMLSDateViewAlignmentX" :@"0.5",
                              @"kMLSDateViewBatteryAlignmentX" :@"0",
                              @"kMLSDateViewIsVibrant" :@"NO"
                          }]];

    [self.preferences writeToFile:_plistfile atomically:YES];
}

- (double)doubleForKey:(NSString *)key {
    return self.preferences[key] ? [self.preferences[key] doubleValue] : 0;
}

- (float)floatForKey:(NSString *)key {
    return self.preferences[key] ? [self.preferences[key] floatValue] : 0;
}

- (BOOL)boolForKey:(NSString *)key {
    return self.preferences[key] ? [self.preferences[key] boolValue] : NO;
}

static void TweakReceivedNotificationToReloadSettings(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo){
    NSString *notificationName = (__bridge NSString *)name;
    if ([notificationName isEqualToString:[NSString stringWithUTF8String:_prefsChanged]]) {
        [[MLSPrefsController sharedInstance] LoadPreferences];
    } else if ([notificationName isEqualToString:[NSString stringWithUTF8String:_prefsReset]]) {
        [[MLSPrefsController sharedInstance] resetPreferences];
    }
}

@end

%ctor {
    @autoreleasepool {
        [[MLSPrefsController sharedInstance] LoadPreferences];

        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                        NULL,
                                        TweakReceivedNotificationToReloadSettings,
                                        CFSTR(_prefsChanged),
                                        NULL,
                                        CFNotificationSuspensionBehaviorCoalesce
                                        );

        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                        NULL,
                                        TweakReceivedNotificationToReloadSettings,
                                        CFSTR(_prefsReset),
                                        NULL,
                                        CFNotificationSuspensionBehaviorCoalesce
                                        );
    }
};
