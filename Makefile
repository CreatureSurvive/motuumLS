ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME=1
TARGET = iphone:clang:9.3:latest
THEOS_DEVICE_IP = 192.168.86.167
THEOS_DEVICE_PORT=22

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = motuumLS
motuumLS_FILES = $(wildcard *.m) $(wildcard *.mm) $(wildcard *.xm)
motuumLS_FRAMEWORKS = UIKit CoreFoundation
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += motuumls
include $(THEOS_MAKE_PATH)/aggregate.mk
