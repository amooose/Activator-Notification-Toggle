include ~/theos/makefiles/common.mk

TWEAK_NAME = NotifToggle
NotifToggle_FILES = Tweak.xm
NotifToggle_FRAMEWORKS = UIKit
NotifToggle_LDFLAGS = -lactivator

include  ~/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
