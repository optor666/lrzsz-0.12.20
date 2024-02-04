#!/usr/bin/env bash
#
# 1. https://www.ohse.de/uwe/software/lrzsz.html
# 2. https://gallium.inria.fr/~doligez/zmodem/zmodem.txt
# 3. https://wiki.synchro.net/ref:zmodem
# 4. https://zhuanlan.zhihu.com/p/579720546
#
wget https://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz
tar -xvf lrzsz-0.12.20.tar.gz
cd lrzsz-0.12.20/

curl -O https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-man-lsz.diff
curl -O https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-po-Makefile.in.in.diff
curl -O https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-src-Makefile.in.diff
curl -O https://raw.githubusercontent.com/macports/macports-ports/ed7e89dfbf638daf6f217274e7a366ebc3c7e34e/comms/lrzsz/files/patch-zglobal.h.diff
curl -O https://raw.githubusercontent.com/macports/macports-ports/1dc9c770d34f9f235e5ed619d9284e521d4bbeb8/comms/lrzsz/files/implicit.patch
curl -O https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-CVE-2018-10195.diff

patch -p0 < patch-man-lsz.diff
patch -p0 < patch-po-Makefile.in.in.diff
patch -p0 < patch-src-Makefile.in.diff
patch -p0 < patch-zglobal.h.diff
patch -p0 < implicit.patch
patch -p0 < patch-CVE-2018-10195.diff

./configure --enable-debug --prefix=/usr/local --disable-nls
make
