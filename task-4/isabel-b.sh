#!/bin/bash

#fungsi untuk membuat zip dari suatu folder
folder_zip() {
    nomor_folder=$1
    zip -r "ayang_$nomor_folder.zip" "folder_$nomor_folder"
}

#inisialisasi jam saat ini
jam_sekarang=$(date +"%H")

for ((i=1; i<=$jam_sekarang; i++))
do
    folder="folder_$i"
    if [[ -d "$folder" ]]; #mengecek apakah folder yang sedang diiterasi ada
    then
        folder_zip "$i" #pemanggilan fungsi
    fi
done
