# Systra

Server management script based on [Webinoly](https://webinoly.com/en/)

- Requires: Ubuntu 18.04 or 20.04
- Includes: NGINX, MariaDB, PHP, Node.js, Composer, Yarn, PM2

## Install

The install script is meant to be run on an empty installation of Ubuntu.

```sh
wget -O - https://github.com/eliot-akira/systra/tarball/master | tar xz --one-top-level=systra --strip-components 1 && ./systra/sys install
```

## Use

The command `sys` will be available after installation. Run it to see help screen.

## Develop

Update bundled Webinoly library

```sh
wget -O - https://github.com/QROkes/webinoly/tarball/master | tar xz --one-top-level=webinoly --strip-components 1 && rm -rf assets/webinoly ; mv webinoly assets
```
