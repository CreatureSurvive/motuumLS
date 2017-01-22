include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = motuumLS
motuumLS_FILES = $(wildcard *.m)
motuumLS_INSTALL_PATH = /Library/PreferenceBundles
motuumLS_FRAMEWORKS = UIKit CoreGraphics
motuumLS_PRIVATE_FRAMEWORKS = Preferences
motuumLS_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/motuumLS.plist$(ECHO_END)
