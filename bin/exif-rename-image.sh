#!/usr/bin/env bash

# Rename image and files so filename encodes datetime:
# - extracted from tags by exiftool
# - file mtime

BASH_DATE_REGEX='^[0-9]{6}-[0-9]{6}(-[0-9]+)?$'
EXIF_DATE_FORMAT=%y%m%d-%H%M%S

file_is_renamed () {
  file_basename=$1
  [[ "$file_basename" =~ $BASH_DATE_REGEX ]]
}

image_orig_datetime () {
  file=$1
  datetime=$(
    exiftool \
      -ext jpg -ext jpeg -ext png -ext mov -ext mp4 \
      -s3 \
      -dateFormat "$EXIF_DATE_FORMAT" \
      -DateTimeOriginal \
      -TrackCreateDate \
      -FileModifyDate \
      "$file" 2>/dev/null
  )
  [ $? -ne 0 ] && return 1
  echo ${datetime%%$'\n'*}
}

file_rename () {
  file=$1
  dirname=$(dirname "$file")
  file_basename=$2
  file_ext=$3

  c=0
  new_file=${dirname}/${file_basename}.${file_ext}

  while [ -f "$new_file" ]; do
    c=$((c+1))
    new_file=${dirname}/${file_basename}-${c}.${file_ext}
  done

  echo "${file} -> ${new_file}"
  mv -f "$file" "$new_file"
}

image_rename () {
  file=$1
  filename=${file##*/}
  file_basename=${filename%.*}
  file_ext=${filename##*.}

  file_is_renamed "$file_basename" && return 0
  new_file_basename=$(image_orig_datetime "$file")
  [ $? -ne 0 ] && return 1

  file_rename "$file" "$new_file_basename" "$file_ext"
}

command -v exiftool >/dev/null 2>&1 || \
  { echo >&2 "exitfool: command not found"; exit 1; }

for file in "$@"; do
  if [ -d "$file" ]; then
    for file in "$file"/*; do
      [ -f "$file" ] && image_rename "$file"
    done
  elif [ -f "$file" ]; then
    image_rename "$file"
  fi
done
