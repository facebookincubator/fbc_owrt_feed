#
# Copyright (C)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ovs_xwf
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Simon Kinane <skinane@fb.com>
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/ovs_xwf
  SECTION:=net
  SUBMENU:=Open vSwitch
  CATEGORY:=Network
  DEPENDS:=+kmod-veth +openvswitch
  TITLE:=OVS AP initialisation for XWF integration
  MENU:=1
endef

define Package/ovs_xwf/description
	TODO - OVS XWF description.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile/Default

endef
Build/Compile = $(Build/Compile/Default)

ifdef CONFIG_SIGNED_PACKAGES
  define Build/Configure
	[ -s $(BUILD_KEY) -a -s $(BUILD_KEY).pub ] || \
		$(STAGING_DIR_HOST)/bin/usign -G -s $(BUILD_KEY) -p $(BUILD_KEY).pub -c "Local build key"

  endef

  define Package/base-files/install-key
	mkdir -p $(1)/etc/opkg/keys
	$(CP) $(BUILD_KEY).pub $(1)/etc/opkg/keys/`$(STAGING_DIR_HOST)/bin/usign -F -p $(BUILD_KEY).pub`

  endef
endif

define Package/ovs_xwf/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xwf.init $(1)/etc/init.d/xwf
endef

$(eval $(call BuildPackage,ovs_xwf))
