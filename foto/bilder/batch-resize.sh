#!/usr/bin/bash

for file in ./source/*
do
	f=$(basename "$file")
	noext="${f%.*}"

	if [ ! -f "$noext 960.jxl" ]
	then
		convert "$file" -resize "960x960>" tmp.png
		convert tmp.png -quality 85 -interlace Plane "$noext 960.jpg"
		cjxl -p -d 1.25 tmp.png "$noext 960.jxl"
		rm tmp.png
	fi

	if [ ! -f "$noext 1920.jpg" ]
	then
		convert "$file" -resize "1920x1920>" tmp.png
		convert tmp.png -quality 60 -interlace Plane "$noext 1920.jpg"
		cjxl -p -d 2.5 tmp.png "$noext 1920.jxl"
		rm tmp.png
	fi
done
