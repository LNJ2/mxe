# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gloox
$(PKG)_WEBSITE  := https://camaya.net/gloox/
$(PKG)_DESCR    := gloox
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.20
$(PKG)_CHECKSUM := 0243086c0f4f0440d6d8e55705f83249a4463a1d75a034be42b5312e8886dea8
$(PKG)_SUBDIR   := gloox-$($(PKG)_VERSION)
$(PKG)_FILE     := gloox-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://camaya.net/download/$($(PKG)_FILE)
$(PKG)_DEPS     := cc libidn2 zlib openssl

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS) \
        --with-zlib=$(PREFIX)/$(TARGET) \
        --with-libidn=$(PREFIX)/$(TARGET) \
        --with-gnutls=no \
        --with-openssl=$(PREFIX)/$(TARGET) \
        --with-tests=no \
        --with-examples=no

    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef

