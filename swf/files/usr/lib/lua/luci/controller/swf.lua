-- Copyright 
-- Licensed to the public under the GNU General Public License v2.

module("luci.controller.swf", package.seeall)

sys = require "luci.sys"
ut = require "luci.util"

function index()
    entry({"admin", "network", "swf"}, template("swf"), "Social Wi-Fi", 90).dependent=false
end

