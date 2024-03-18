#!/bin/bash

simpan_foto() {
    #waktu saat ini dalam format jam dan menit
    waktu_sekarang=$(date +%H.%M)

    #variabel diikuti argumen
    nama_folder="folder_$1"

    #membuat direktori baru
    mkdir -p "$nama_folder"

    #kondisi ketika waktu 00.00
    if [[ $waktu_sekarang == "00.00" ]];
    then
        for ((i=1; i<=10; i++));
        do
            wget -O "$nama_folder/foto_$i.jpg" "https://drive.google.com/drive/folders/11o9WxJ_ogiWBC4jSyfWxw9mU5726hVCw"
        done
    #kondisi ketika waktu genap
    elif (( $(echo "$waktu_sekarang" | cut -d. -f1) % 2 == 0 ));
    then
        for ((i=1; i<=5; i++));
        do
            wget -O "$nama_folder/foto_$i.jpg" "https://drive.google.com/drive/folders/11o9WxJ_ogiWBC4jSyfWxw9mU5726hVCw"
        done
    #kondisi ketika waktu ganjil
    else
        for ((i=1; i<=3; i++));
        do
            wget -O "$nama_folder/foto_$i.jpg" "https://drive.google.com/drive/folders/11o9WxJ_ogiWBC4jSyfWxw9mU5726hVCw"
        done
    fi
}

#jam saat ini
jam_sekarang=$(date +%H)
#menghitung nomor folder berdasarkan jam
angka_folder=$((jam_sekarang / 5 + 1))

simpan_foto "$angka_folder"
