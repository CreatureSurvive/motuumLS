ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME=1
TARGET = iphone:clang:9.3:latest
THEOS_DEVICE_IP = 192.168.86.172
THEOS_DEVICE_PORT=22

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = motuumLS
motuumLS_FILES = $(wildcard *.m) $(wildcard *.mm) $(wildcard *.xm) $(wildcard 3rdParty/*.m)
motuumLS_FRAMEWORKS = UIKit CoreFoundation
motuumLS_PRIVATE_FRAMEWORKS = MediaPlayerUI
ADDITIONAL_OBJCFLAGS += -fobjc-arc -w
motuumLS_LDFLAGS = -lcolorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 SpringBoard"
	
SUBPROJECTS += motuumls
include $(THEOS_MAKE_PATH)/aggregate.mk
