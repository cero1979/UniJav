#!/bin/sh

cd $(pwd) 
tiff_files=$(find . -iname "*.tif")

total=$(echo "$tiff_files" | wc -l)
num=0

echo "There are $total files to be converted."

for f in $tiff_files
do
        ((num++))
        echo "Converting $f, $num/$total"
        convert "$f" "${f%.tif}.jpg"
        clear
done
