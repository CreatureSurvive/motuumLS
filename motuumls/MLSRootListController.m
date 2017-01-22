#include "MLSRootListController.h"

@implementation MLSRootListController

- (id)init {
    if ((self = [super init]) != nil) {
        _settings = [NSMutableDictionary dictionaryWithContentsOfFile:_plistfile] ? : [NSMutableDictionary dictionary];
    }

    return self;
}

// gets the specifiers from Root.plist
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }

    return _specifiers;
}

- (void)setCellForRowAtIndexPath:(NSIndexPath *)indexPath enabled:(BOOL)enabled {
    UITableViewCell *cell = [self tableView:self.table cellForRowAtIndexPath:indexPath];
    if (cell) {
        cell.userInteractionEnabled = enabled;
        cell.textLabel.enabled = enabled;
        cell.detailTextLabel.enabled = enabled;

        if ([cell isKindOfClass:[PSControlTableCell class]]) {
            PSControlTableCell *controlCell = (PSControlTableCell *)cell;
            if (controlCell.control) {
                controlCell.control.enabled = enabled;
            }
        }
    }
}

- (void)setViewTintColorsForSettings:(BOOL)visible {
    if (visible) {
        // Color the navbar
        self.navigationController.navigationController.navigationBar.tintColor = NavText_Color;
        self.navigationController.navigationController.navigationBar.barTintColor = NavBackground_Color;
        self.navigationController.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : NavText_Color};

        // set specific cell colors
        [UISwitch appearanceWhenContainedInInstancesOfClasses:@[[self.class class]]].onTintColor = Controls_Color;
        [UITableView appearanceWhenContainedInInstancesOfClasses:@[[self.class class]]].tintColor = Controls_Color;
        [UISegmentedControl appearanceWhenContainedInInstancesOfClasses:@[[self.class class]]].tintColor = Controls_Color;

        // set the view tint
        self.view.tintColor = MainTint_Color;
    } else {
        // Un-Color the navbar
        self.navigationController.navigationController.navigationBar.tintColor = nil;
        self.navigationController.navigationController.navigationBar.barTintColor = nil;
        self.navigationController.navigationController.navigationBar.titleTextAttributes = nil;

    }
}

- (void)setViewBanner {


    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.table.bounds.size.width, 128)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    UILabel *subHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    UILabel *subHeaderLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
    // UILabel *randomLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    // NSArray *randomTexts = [NSArray arrayWithObjects:@"Thank You For Installing", @"Report Any Bugs", @"Contact Me With Any Suggetions",
    //                         @"by CreatureSurvive",
    //                         nil];

    headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [headerLabel setNumberOfLines:1];
    [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:36]];
    [headerLabel setText:@"motuumLS"];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setTextColor:HeaderMainText_Color];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:headerLabel];
    [headerLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:headerLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:header attribute:NSLayoutAttributeBottom multiplier:0.2 constant:0]];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:headerLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:header attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    subHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [subHeaderLabel setNumberOfLines:1];
    [subHeaderLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
    [subHeaderLabel setText:@"Your LockScreen, Your Way"];
    [subHeaderLabel setBackgroundColor:[UIColor clearColor]];
    [subHeaderLabel setTextColor:HeaderSubText_Color];
    [subHeaderLabel setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:subHeaderLabel];
    [subHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:subHeaderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:subHeaderLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:header attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    subHeaderLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [subHeaderLabel2 setNumberOfLines:1];
    [subHeaderLabel2 setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
    [subHeaderLabel2 setText:@"By: CreatureSurvive"];
    [subHeaderLabel2 setBackgroundColor:[UIColor clearColor]];
    [subHeaderLabel2 setTextColor:HeaderSubText_Color];
    [subHeaderLabel2 setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:subHeaderLabel2];
    [subHeaderLabel2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:subHeaderLabel2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subHeaderLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    [header addConstraint:[NSLayoutConstraint constraintWithItem:subHeaderLabel2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:header attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    // randomLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    // [randomLabel setNumberOfLines:1];
    // [randomLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
    // [randomLabel setText:randomTexts[arc4random_uniform(randomTexts.count)]];
    // [randomLabel setBackgroundColor:[UIColor clearColor]];
    // [randomLabel setTextColor:[UIColor grayColor]];
    // [randomLabel setTextAlignment:NSTextAlignmentCenter];
    // [header addSubview:randomLabel];
    // [randomLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    // [header addConstraint:[NSLayoutConstraint constraintWithItem:randomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subHeaderLabel2 attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
    // [header addConstraint:[NSLayoutConstraint constraintWithItem:randomLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:header attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    self.table.tableHeaderView = header;
}

- (void)viewWillAppear:(BOOL)animated {
    _settings = ([NSMutableDictionary dictionaryWithContentsOfFile:_plistfile] ? : [NSMutableDictionary dictionary]);
    [super viewWillAppear:animated];
    [self setViewTintColorsForSettings:YES];
    [self reload];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setViewTintColorsForSettings:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewBanner];
}

// sets cell specific values
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell.textLabel setAdjustsFontSizeToFitWidth:YES];

    // if ([cell isKindOfClass:[PSSwitchTableCell class]]) {
    //  UISwitch *contactSwitch = (UISwitch *)((PSControlTableCell *)cell).control;
    //  contactSwitch.onTintColor = navigationController.navigationBar.tintColor;
    // }
    cell.textLabel.textColor = MainTint_Color;
    return cell;
}

// writes setting directly to plist
- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
    NSString *key = [specifier propertyForKey:@"key"];
    _settings = ([NSMutableDictionary dictionaryWithContentsOfFile:_plistfile] ? : [NSMutableDictionary dictionary]);
    [_settings setObject:value forKey:key];
    [_settings writeToFile:_plistfile atomically:YES];

    if ([key isEqualToString:@"kMLSDateViewBatteryEnabled"]) {
        BOOL enableCell = [value boolValue];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:1] enabled:enableCell];
    }

    NSString *post = [specifier propertyForKey:@"PostNotification"];
    if (post) {
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (__bridge CFStringRef)post, NULL, NULL, TRUE);
    }
}

// reads settings directly from plist
- (id)readPreferenceValue:(PSSpecifier *)specifier {
    NSString *key = [specifier propertyForKey:@"key"];
    id defaultValue = [specifier propertyForKey:@"default"];
    id plistValue = [_settings objectForKey:key];
    if (!plistValue) plistValue = defaultValue;

    if ([key isEqualToString:@"kMLSDateViewBatteryEnabled"]) {
        BOOL enableCell = plistValue && [plistValue boolValue];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:1] enabled:enableCell];

    }

    return plistValue;
}

// Respring methon
- (void)respring {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"motuumLS"
                                                                             message:@"Do you want to respring now?"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                             style:UIAlertActionStyleCancel
                                           handler:nil];

    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Respring"
                                         style:UIAlertActionStyleDestructive
                                       handler:^(UIAlertAction *action) {
                                                                                                                                                                                                        #pragma GCC diagnostic push
                                                                                                                                                                                                        #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        system("killall -9 SpringBoard");
                                                                                                                                                                                                        #pragma GCC diagnostic pop
    }];

    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

// launch Github
- (void)github {
    NSURL *githubURL = [NSURL URLWithString:@"https://github.com/creaturesurvive"];
    [[UIApplication sharedApplication] openURL:githubURL];
}

// launch Email
- (void)contact {
    NSURL *url = [NSURL URLWithString:@"mailto:dbuehre@gmail.com?subject=motuumLS"];
    [[UIApplication sharedApplication] openURL:url];
}

// launch PayPal
- (void)paypal {
    NSURL *url = [NSURL URLWithString:@"https://paypal.me/creaturesurvive"];
    [[UIApplication sharedApplication] openURL:url];
}

// launch Twitter
- (void)twitter {
    NSString *user = @"creaturesurvive";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];

    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];

    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];

    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];

    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
}

@end
