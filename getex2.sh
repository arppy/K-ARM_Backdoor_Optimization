#!/bin/bash

source_dir="/home/danner/data/imagenet/validation_data"
dest_dir="destination_folder"
X=10 # number of images per class

# imagenette
declare -a indices=(0 217 482 491 497 566 569 571 574 701)

mkdir -p "$dest_dir"
subfolders=($(ls -d "$source_dir"/*/ | sort))
for i in "${!indices[@]}"; do
	index=${indices[$i]}
	subfolder_path=${subfolders[$index]}
	files=($(find "$subfolder_path" -type f | shuf -n $X))
	for file_path in "${files[@]}"; do
		filename=$(basename "$file_path")
		filename="${filename%.*}"
		filename="${filename:0:10}_${i}${filename:10}"
		convert "$file_path" "$dest_dir/${filename}.png"
	done
done