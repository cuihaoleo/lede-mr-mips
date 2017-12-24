#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mips
BOARD:=mr-mips
BOARDNAME:=Mikrotik MetaROUTER MIPS
FEATURES:=targz

KERNEL_PATCHVER:=3.18

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES+=-mtd -ppp

$(eval $(call BuildTarget))

