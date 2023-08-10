#!/bin/bash

LogDirectory="E:\CodingNinjasWebD\DevOps\Log"


cd "$LogDirectory" || exit

#Finding  the largest log file

LogFiles=$(find "$LogDirectory" -type f -name "*.log")
LargestSize=0
LargestFile=""


for file in $LogFiles; do
    size=$(stat -c %s "$file")
    if [ "$size" -gt "$LargestSize" ]; then
        LargestSize="$size"
        LargestFile="$file"
    fi
done

path="$LargestFile"

# Extract the filename from the path
filename=$(basename "$path")



#  Truncate the largest log file into  100 lines
 tail -n 100 "$filename" > "$filename.tmp"
 mv "$filename.tmp" "$filename"






