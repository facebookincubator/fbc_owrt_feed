# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=swf
PKG_VERSION:=2
PKG_RELEASE:=0

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://codeload.github.com/coova/swf/tar.gz/$(PKG_VERSION)?
#PKG_HASH:=987647a4c8efe7b1e2d7108d56068e3bd7830d326680f0eaa2c705e4c59c46d9

PKG_MAINTAINER:=Simon Kinane <skinane@fb.com>
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

#PKG_FIXUP:=autoreconf
#PKG_INSTALL:=1
#PKG_BUILD_PARALLEL:=0

#PKG_CONFIG_DEPENDS:= \
#  COOVACHILLI_MINIPORTAL \
#  COOVACHILLI_REDIR \
#  COOVACHILLI_USERAGENT \
#  COOVACHILLI_DNSLOG \
#  COOVACHILLI_UAMDOMAINFILE \
#  COOVACHILLI_LARGELIMITS \
#  COOVACHILLI_NOSSL \
#  COOVACHILLI_WOLFSSL \
#  COOVACHILLI_OPENSSL

include $(INCLUDE_DIR)/package.mk

define Package/swf
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Facebook Social Wi-Fi Access Point Authorization Service
  URL:=https://www.facebook.com/facebook-wifi
  MENU:=1
endef

define Package/swf/description
	CoovaChilli is an open source access controller for wireless LAN
	access points and is based on ChilliSpot. It is used for authenticating
	users of a wireless (or wired) LAN. It supports web based login (UAM)
	which is today's standard for public HotSpots and it supports Wireless
	Protected Access (WPA) which is the standard of the future.
	Authentication,	authorization and accounting (AAA) is handled by your
	favorite radius server.
endef

#define Package/swf/config
#  source "$(SOURCE)/Config.in"
#endef

define Package/swf/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/swf.init $(1)/etc/init.d/swf
endef

$(eval $(call BuildPackage,swf))
