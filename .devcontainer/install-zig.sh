#!/bin/sh

ZIG_VERSION=0.14.0
ARCHITECTURE=$(uname -m)
ZIG_DIR=zig-linux-$ARCHITECTURE-$ZIG_VERSION
wget -O /tmp/zig-linux-$ARCHITECTURE-$ZIG_VERSION.tar.xz https://ziglang.org/download/$ZIG_VERSION/zig-linux-$ARCHITECTURE-$ZIG_VERSION.tar.xz
mkdir -p $HOME/$ZIG_DIR
tar -xf /tmp/zig-linux-$ARCHITECTURE-$ZIG_VERSION.tar.xz -C $HOME/$ZIG_DIR --strip-components=1

# Remove any previous zig path export lines from ~/.zshrc
sed -i "/export PATH=\"${HOME//\//\\/}\/zig-linux-.*:\$PATH\"/d" ~/.zshrc
# Add the new export line
echo "export PATH=\"$HOME/zig-linux-$ARCHITECTURE-$ZIG_VERSION:\$PATH\"" >> ~/.zshrc

# Remove the downloaded tar file
rm -f /tmp/zig-linux-$ARCHITECTURE-$ZIG_VERSION.tar.xz