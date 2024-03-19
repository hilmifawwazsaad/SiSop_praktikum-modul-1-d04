#!/bin/bash

#letak directory peyimpanan folder dan zip
directory="/home/hilmifawwaz/sisop/praktikum-modul-1-d04/task4"

#variabel boolean untuk inisialisasi folder
folder_ditemukan=false
#cek apakah ada folder dalam directory, jika ada hapus
for folder in "$directory"/folder_*; do
    if [ -d "$folder" ];
    then
        folder_ditemukan=true
        rm -rf "$folder" #hapus folder
        echo "Folder $folder telah dihapus"
    fi
done

#kondisi jika tidak ada folder di directory
if ! $folder_ditemukan;
then
    echo "Tidak ada folder di direktori $directory"
fi

#variabel boolean untuk inisialisasi zip
zip_ditemukan=false
#cek apakah ada file zip di direktori, jika ada hapus
for zip_file in "$directory"/ayang_*.zip; do
    if [ -f "$zip_file" ]; 
    then
        folder_ditemukan=true
        rm -f "$zip_file" #hapus file zip
        echo "File zip $zip_file telah dihapus"
    fi
done

#kondisi jika tidak ada file zip dalam directory
if ! $zip_ditemukan;
then
    echo "Tidak ada zip di direktori $directory"
fi
