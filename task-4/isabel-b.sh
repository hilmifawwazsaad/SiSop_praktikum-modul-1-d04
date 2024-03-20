#!/bin/bash

#fungsi untuk membuat zip dari suatu folder
folder_zip() {
    nomor_folder=$1
    zip -r "ayang_$nomor_folder.zip" "folder_$nomor_folder"
}

#nendapatkan jumlah folder dalam direktori
jumlah_folder=$(ls -d folder_* | wc -l)

for ((i=1; i<=$jumlah_folder; i++)); do
    folder="folder_$i"
    if [[ -d "$folder" ]]; then
        folder_zip "$i"
    fi
done
