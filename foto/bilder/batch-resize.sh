#! /usr/bin/bash

#This is a piece of witchcraft where every line has had at least one corresponding stackoverflow search, proceed at your own risk

for file in *
do
	noext="${file%.*}"
	ext="${file##*.}"
	if [[ "${ext,,}" == "jpg" ]] && [[ "${noext}" != *"-small" ]]
	then
		if [ ! -f "$noext-small.$ext" ]
		then
			echo $file
			convert -resize x480 "$file" "$noext-small.$ext"
		fi
	fi
done

