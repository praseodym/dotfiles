function exifdate
exiftool -m -DateTimeOriginal $argv[1]/* | grep Original | cut -d: -f2- | cut -d' ' -f2 | sort | uniq -c
end
