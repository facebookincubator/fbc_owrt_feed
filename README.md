# OpenWrt packages feed from Facebook Connectivity

## Description

This is an OpenWrt "packages"-feed containing code patches and configuration script from the Facebook Connectivity projects.

## Usage

This repository is intended to be layered on-top of an OpenWrt buildroot. If you do not have an OpenWrt buildroot installed, see the documentation at: [OpenWrt Buildroot – Installation](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem) on the OpenWrt support site.

This feed needs to be added to your buildroot configuration. To install all its package definitions, run:
```
echo "src-git fbc https://github.com/internetorg/fbc_owrt_feed.git" >> feeds.conf.default
./scripts/feeds update fbc
./scripts/feeds install -a -p fbc
```

To learn more about the Express Wi-Fi programme and connect with Facebook partnership engineers, visit [Express Wi-Fi](https://expresswifi.fb.com).

## License

See [LICENSE](LICENSE) file.
 
## Package Guidelines

See [CONTRIBUTING.md](CONTRIBUTING.md) file.

