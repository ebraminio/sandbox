#! /bin/bash
set -e -x

work="$1"
cd "$work"
apt-get -qq update && apt-get install -qy git autoconf automake make libtool gcc g++ pkg-config libfreetype6-dev libglib2.0-dev libcairo2-dev
git clone https://github.com/harfbuzz/harfbuzz
cd harfbuzz
./autogen.sh --with-freetype --with-glib --with-cairo
make && make check
