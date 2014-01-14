#!/bin/sh
# Damn stupid file to copy all files to the right locations

if [ "X$1" = "X" ]
then
    INSTALL_PREFIX="/usr"
else
    INSTALL_PREFIX="$1"
fi

mkdir -p $DESTDIR$INSTALL_PREFIX
if [ ! -w $DESTDIR$INSTALL_PREFIX ]
then
    echo "\nERROR: $DESTDIR$INSTALL_PREFIX is not writable."
    exit
fi

TARGET=$DESTDIR$INSTALL_PREFIX

mkdir -p $DESTDIR/etc
mkdir -p $TARGET/lib/live-installer
mkdir -p $TARGET/share/live-installer
mkdir -p $TARGET/share/applications
mkdir -p $TARGET/share/icons
mkdir -p $TARGET/share/menu
mkdir -p $TARGET/bin

cp -r config/ $DESTDIR/etc
cp -r src/ $TARGET/lib/live-installer
cp -r data/live-installer/ $TARGET/share/live-installer
cp -r data/applications/ $TARGET/share/applications
cp -r data/icons $TARGET/share/icons
cp -r data/menu $TARGET/share/menu
cp -r data/bin $TARGET/bin
