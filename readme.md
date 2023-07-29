# Systra

Server management tool based on [Webinoly](https://github.com/QROkes/webinoly)

- Requires: Ubuntu 22.04 or 20.04
- Includes: NGINX, MariaDB, PHP, Composer, Node.js, NPM, PM2

## Install

The install script is meant to be run on a new installation of Ubuntu.

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
