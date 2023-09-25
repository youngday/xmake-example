# xmake and xrepo
* https://xmake.io/#/
* https://xrepo.xmake.io/#/
## xmake install 
```sh
bash <(wget https://xmake.io/shget.text -O -)
curl -fsSL https://xmake.io/shget.text | bash
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
## xmake project compile and install
```sh
xmake
xmake install --admin
```
## xmake cli

xmake f --menu    xmake gui

## config

https://xmake.io/mirror/zh-cn/guide/configuration.html

### repo

https://xmake.io/#/package/remote_package?id=manual-download

```sh
 xmake g --pkg_searchdirs="~/lib"
```

### gitee

```sh
export XMAKE_MAIN_REPO=https://gitee.com/xmake-io/xmake-repo.git
export XMAKE_BINARY_REPO=https://gitee.com/xmake-mirror/build-artifacts.git
```

### ssl issues

curl：(60) SSL

curl -k https://github.com

## xmake update

xmake update -s dev
xmake update

or use

bash <(curl -fsSL https://xmake.io/shget.text)

curl -fsSL https://xmake.io/shget.text | bash

## xrepo update-repo

xrepo update-repo
xmake f -c
xmake

``

## check

xmake check clang.tidy --fix
xmake check clang.tidy --fix_errors
xmake check clang.tidy --fix_notes

## qtpath

$ xmake f --qt=/home/xxx/qtsdk
或者设置到全局路径，避免每次编译切换都要配置一遍：
$ xmake g --qt=/home/xxx/qtsdk

## local rep

xmake g --pkg_searchdirs=/xxx

## end

🐞
