ARCHS = arm64 #armv7
GO_EASY_ON_ME=1
TARGET = iphone:clang:10.1:latest
THEOS_DEVICE_IP = 192.168.86.166
THEOS_DEVICE_PORT=22

FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = motuumLS
motuumLS_FILES = $(wildcard *.m) $(wildcard *.xm)
motuumLS_FRAMEWORKS = UIKit
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"