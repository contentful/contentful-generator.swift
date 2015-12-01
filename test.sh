#!/bin/sh

. /usr/local/opt/chswift/share/chswift/chswift.sh
chswift 2.1

FRAMEWORKS=$HOME/.📦/ctf-generator/Rome

./bin/ctf-generator cfexampleapi b4c0n73n7fu1
xcrun --sdk macosx swiftc -F$FRAMEWORKS -framework Contentful \
  -module-name YOLO -c *.swift
rm -f *.o

