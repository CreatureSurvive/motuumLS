// imports
#import <Preferences/PSListController.h>
#import <Preferences/PSControlTableCell.h>
#import <Preferences/PSSpecifier.h>

#import "MLSDefines.h"

// defines
#define _plistfile (@"/User/Library/Preferences/com.creaturesurvive.motuumls.plist")
#define _prefsChanged (@"com.creaturesurvive.motuumls.prefschanged")
#define _bundleID (@"com.creaturesurvive.motuumls")


@interface MLSRootListController : PSListController {
    NSMutableDictionary *_settings;
}
- (void)setViewTintColorsForSettings:(BOOL)visible;
- (void)setCellForRowAtIndexPath:(NSIndexPath *)indexPath enabled:(BOOL)enabled;
@end
