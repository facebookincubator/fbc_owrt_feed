# Facebook Wi-Fi v2.0 Reference Implementation for OpenWRT 

## Getting started

Case studies for OEM customers are available at the official page of [Facebook Wi-Fi](https://www.facebook.com/facebook-wifi).

For OEM engineers, start by reading the init script in [files/etc/init.d/fbwifi](https://github.com/facebookincubator/fbc_owrt_feed/blob/master/swf/files/etc/init.d/fbwifi)

## Contents

The 'files' subdirectory contains all the configuration, script and code 
that implements the Facebook Wi-Fi v2.0 standard for OpenWRT.

The folder structure follows *nix conventions :
'etc' is the boot time scripts and configuration
'usr' contains procedural scripts, lua common code module and GUI prototype for luci
'www' contains the HTTP endpoints as CGI handlers 

files/
├── etc
│   ├── config
│   │   ├── fbwifi
│   │   └── swf
│   ├── init.d
│   │   └── fbwifi
│   └── lighttpd
│       ├── conf.d
│       │   ├── 35-https.conf
│       │   ├── 40-swf.conf
│       │   └── 90-luci.conf
│       └── fbwifi_redirect.conf -> /var/run/fbwifi_redirect.conf
├── usr
│   ├── lib
│   │   └── lua
│   │       ├── fbwifi.lua
│   │       └── luci
│   │           ├── controller
│   │           │   └── fbwifi.lua
│   │           └── view
│   │               └── fbwifi.htm
│   └── sbin
│       ├── fbwifi_debug_dump
│       ├── fbwifi_gateway_info_update
│       ├── fbwifi_get_config
│       └── fbwifi_validate_token_db
└── www
    └── fbwifi
        └── v2.0
            ├── auth
            ├── capport
            └── info

