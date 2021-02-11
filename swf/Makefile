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
PKG_LICENSE:=GPL-2.0

PKG_MAINTAINER:=Simon Kinane <skinane@fb.com>

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/swf
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+iptables +luasec +luasocket +uboot-envtools
  TITLE:=Social Wi-Fi by Facebook
  PKGARCH:=all
endef

define Package/swf/description
  Facebook Social Wi-Fi, an AP authorisation solution 
endef

#define Package/swf/conffiles
#/etc/config/qos
#endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/swf/install
	$(INSTALL_DIR) $(1)
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,swf))
