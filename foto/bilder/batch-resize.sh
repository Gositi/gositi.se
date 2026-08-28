#!/usr/bin/bash

# This is a piece of witchcraft where every line has had at least one corresponding stackoverflow search, proceed at your own risk

for file in *
do
	noext="${file%.*}"
	ext="${file##*.}"
	if [[ "${ext,,}" == "jpg" ]] && [[ "${noext}" != *"-small" ]]
	then
		if [ ! -f "$noext-small.jpg" ]
		then
			echo $file
			convert "$file" -resize "960x960>" tmp.png
			convert tmp.png -resize "960x960>" -quality 90 -interlace Plane "$noext-small.jpg"
			cjxl -p tmp.png "$noext-small.jxl"
			rm tmp.png
		fi
	fi
done

