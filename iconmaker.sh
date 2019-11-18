#!/bin/sh
# 制作icns图标
if [ $# = 2 ]
then
mkdir tmp.iconset
sips -z 512 512 $1 --out tmp.iconset/icon_512x512.png
iconutil -c icns tmp.iconset -o $2
rm -rf tmp.iconset
else
echo "missing argument"
fi
