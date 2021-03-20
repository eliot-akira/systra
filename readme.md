# Systra

Server management script based on [Webinoly](https://webinoly.com/en/)

## Install

```sh
wget -O - https://github.com/eliot-akira/systra/tarball/master | tar xz --one-top-level=systra --strip-components 1 && ./systra/sys install
```

## Develop

Update bundled Webinoly library

```sh
wget -O - https://github.com/QROkes/webinoly/tarball/master | tar xz --one-top-level=webinoly --strip-components 1 && rm -rf assets/webinoly ; mv webinoly assets
```
