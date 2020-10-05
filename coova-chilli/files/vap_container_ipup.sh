#!/bin/bash
#
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This software may be used and distributed according to the terms of the
# GNU General Public License version 2.

# force-add the final rule necessary to fix routing tables
iptables -I POSTROUTING -t nat -o "$HS_WANIF" -j MASQUERADE
