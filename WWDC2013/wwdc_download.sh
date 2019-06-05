#!/bin/bash
# SCRIPT:  wwdc_doanload.sh
# PURPOSE: Process a file line by line with PIPED while-read loop. And Start the download from the web link mentioned there.

PWD=$(pwd)
DOWNLOAD_DESTINATION=$1
DOWNLOAD_SD=$2
DOWNLOADABLE_SD_LINKS=$PWD/wwdc_downloadList_SD.txt
DOWNLOADABLE_HD_LINKS=$PWD/wwdc_downloadList_HD.txt
DOWNLOADABLE_PDF_LINKS=$PWD/wwdc_downloadList_PDF.txt
DOWNLOADABLE_LINKS=$DOWNLOADABLE_SD_LINKS
TITLE_LIST=$PWD/wwdc_title.txt

if [[ $DOWNLOAD_SD == 1 ]]; then
	DOWNLOADABLE_LINKS=$DOWNLOADABLE_HD_LINKS
fi

echo "Your download will be available at $DOWNLOAD_DESTINATION"

cd $DOWNLOAD_DESTINATION

cat $DOWNLOADABLE_LINKS | while read LINE
do
	echo "Begining downloading file from: $LINE"
	curl -O "$LINE"

done

# Download PDFs
DOWNLOADABLE_LINKS=$DOWNLOADABLE_PDF_LINKS

cat $DOWNLOADABLE_LINKS | while read LINE
do
	echo "Begining downloading file from: $LINE"
	curl -O "$LINE"

done


cat $TITLE_LIST | while read line
do
	id=`echo "$line"|cut -d':' -f1`
	name=`echo "$line"|cut -d':' -f2`
	echo "Rneming File: $id - $name"
	find "$PWD" -name "$id*" | while read file
	do
		dir="${file%/*}"
		filename="${file%.*}"
		extension="${file##*.}"
		only rename pdf&mov file &srt
		if [[ "$extension" != "mov" && "$extension" != "pdf" ]]; then
			continue
		fi
		echo "Setting up file: $id - $name"
		mv "$file" "$dir/$id - $name.$extension"
	done
 
done
