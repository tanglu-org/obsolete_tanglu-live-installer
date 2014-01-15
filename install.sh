#!/bin/bash
set -e
# Damn stupid script to copy all files to the right locations

for arg; do
  case $arg in
    DESTDIR=*) DESTDIR=${arg#DESTDIR=};;
    PREFIX=*) INSTALL_PREFIX=${arg#PREFIX=};;
  esac;
done

if [ -z "$INSTALL_PREFIX" ]; then
  INSTALL_PREFIX="/usr"
fi

mkdir -p $DESTDIR$INSTALL_PREFIX
if [ ! -w $DESTDIR$INSTALL_PREFIX ]
then
    echo "ERROR: $DESTDIR$INSTALL_PREFIX is not writable."
    exit
fi

TARGET=$DESTDIR$INSTALL_PREFIX

mkdir -p $DESTDIR/etc
mkdir -p $TARGET/lib/live-installer
mkdir -p $TARGET/share/live-installer
mkdir -p $TARGET/share/live-installer/slideshow-kde
mkdir -p $TARGET/share/live-installer/slideshow-gnome
mkdir -p $TARGET/share/applications
mkdir -p $TARGET/share/icons
mkdir -p $TARGET/share/menu
mkdir -p $TARGET/bin

cp -dr config/* $DESTDIR/etc/
cp -dr src/* $TARGET/lib/live-installer/

cp -dr data/live-installer/* $TARGET/share/live-installer/

cp data/applications/debian-installer-launcher.desktop $TARGET/share/applications/
cp data/icons/*.png $TARGET/share/icons/
cp data/icons/*.xpm $TARGET/share/icons/
cp data/menu/live-installer $TARGET/share/menu/

cp data/bin/live-installer $TARGET/bin
cp data/bin/live-installer-dm $TARGET/bin

cp -r slideshows/kde/* $TARGET/share/live-installer/slideshow-kde/
cp -r slideshows/gnome/* $TARGET/share/live-installer/slideshow-gnome/
