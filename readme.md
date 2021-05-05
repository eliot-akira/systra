# Systra

Server management tool based on [Webinoly](https://github.com/QROkes/webinoly)

- Requires: Ubuntu 18.04 or 20.04
- Includes: NGINX, MariaDB, PHP, Node.js, Composer, Yarn, PM2

## Install

The install script is meant to be run on an empty installation of Ubuntu.

```sh
wget -O - https://github.com/eliot-akira/systra/tarball/master | tar xz --one-top-level=systra --strip-components 1 && ./systra/sys install
```

## Use

The command `sys` will be available after installation. Run it to see help screen.

```
Usage: sys [command]

Available commands:

  install                   Install system

  new [domain]              Create new site
  new [domain] [folder]     Create new child site

  delete [domain]           Delete site
  delete [domain] [folder]  Delete child site

  info                      Info about system
  info [domain]             Info about site
  info [domain] [folder]    Info about child site

  list                      List sites
  list-db                   List databases
  list-cert                 List certificates
```

## Develop

Update bundled Webinoly from library root.

```sh
wget -O - https://github.com/eliot-akira/webinoly/tarball/master | tar xz --one-top-level=webinoly --strip-components 1 && rm -rf assets/webinoly ; mv webinoly assets
```

### PHP 7.2

Forked Webinoly preserves ability to install PHP 7.2

```
./plugins/stack:171:			[[ $(conf_read php-v7.2) == "true" ]] && conf_write php-v7.2 purged
./lib/install:224:	[[ $ver =~ ^(7.2|7.3)$ ]] && sudo apt -y install php${ver}-recode
./lib/install:429:		[[ $ver == 7.2 ]] && sudo sed -i '/listen = /c\listen = 127.0.0.1:9003' /etc/php/$ver/fpm/pool.d/www.conf
./lib/general:10:readonly php_supported=(7.2 7.3 7.4 8.0)
```
