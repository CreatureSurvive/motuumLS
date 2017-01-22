//
// Created by Dana Buehre on 1/22/17.
// Copyright (c) 2017 CreatureSurvive. All rights reserved.
//

#define _plistfile (@"/User/Library/Preferences/com.creaturesurvive.motuumls.plist")
#define _prefsChanged "com.creaturesurvive.motuumls.prefschanged"
#define _prefsReset "com.creaturesurvive.motuumls.prefsreset"
#define _bundleID (@"com.creaturesurvive.motuumls")

@class NSMutableDictionary;

@interface MLSPrefsController : NSObject
@property (nonatomic, retain) NSMutableDictionary *preferences;
+ (instancetype)sharedInstance;
- (double)doubleForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
@end
