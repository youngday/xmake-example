# xmake-example

## example

lock-free concurrentqueue, udp ,tcp ,cppzmq,loguru,

## xmake 

* https://xmake.io/#/
* https://xrepo.xmake.io/#/
  
## install

```sh
bash <(wget https://xmake.io/shget.text -O -)
```

## ide

vscode + xmake + gcc

## packages

https://xrepo.xmake.io/#/packages

xrepo ,apt ,conan,vcpkg,cmake,and make install 

```sh
# make install at "/usr/local/lib"
xmake l find_package fmt 
xmake l find_package cmake::fmt
xmake l find_package conan::fmt
xmake l find_package apt::fmt
```

## xmake cli

xmake f --menu    xmkae gui

## config

https://xmake.io/mirror/zh-cn/guide/configuration.html

### repo

### gitee

```sh
export XMAKE_MAIN_REPO=https://gitee.com/xmake-io/xmake-repo.git
export XMAKE_BINARY_REPO=https://gitee.com/xmake-mirror/build-artifacts.git
```

### ssl issues

curl：(60) SSL

curl -k https://github.com

## update

xrepo update-repo
xmake f -c
xmake

``

## end

🐞
