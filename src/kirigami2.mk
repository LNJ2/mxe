# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := kirigami2
$(PKG)_WEBSITE  := https://www.kde.org/products/kirigami/
$(PKG)_DESCR    := Kirigami
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.44.0
$(PKG)_KF5_VER  := 5.44
$(PKG)_CHECKSUM := d0c8a798bc9aa448ba87473d20e2694e0334e3e610b151e7b307ec24051b78ef
$(PKG)_FILE     := kirigami2-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://download.kde.org/stable/frameworks/$($(PKG)_KF5_VER)/$($(PKG)_FILE)
$(PKG)_DEPS     := cc qtquickcontrols2 qttranslations

define $(PKG)_BUILD
    cd '$(1)' && $(TARGET)-cmake $(1)/$(PKG)-$($(PKG)_VERSION)

    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef

