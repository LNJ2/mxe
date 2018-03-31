# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := kaidan
$(PKG)_WEBSITE  := https://github.com/Kaidanim/Kaidan
$(PKG)_DESCR    := The first fully convergant and cross-platform Jabber/XMPP Instant Messenger
$(PKG)_IGNORE   :=
$(PKG)_OWNER    := https://github.com/lnj2
$(PKG)_VERSION  := 0.3.2
$(PKG)_GH_CONF  := KaidanIM/Kaidan/releases/latest,v
$(PKG)_CHECKSUM := e1c7eba82fc76f1660403c6f2ffe6fcd8f3fda13ed9f40f75d9b7bcd881e0f57
$(PKG)_DEPS     := cc qtbase qtconnectivity qtgraphicaleffects qtsvg \
                   qtquickcontrols2 qttranslations qtwinextras gloox kirigami2

define $(PKG)_BUILD
    cd '$(1)' && $(TARGET)-cmake '$(SOURCE_DIR)' \
        -DCMAKE_INSTALL_PREFIX=$(PREFIX)/$(TARGET)/apps/$(PKG) \
        -DI18N=1
    $(MAKE) -C '$(1)' -j $(JOBS) VERBOSE=1
    $(MAKE) -C '$(1)' -j 1 install
endef

