#!/bin/bash

#fungsi untuk mendownload foto Levi
download_foto_levi() {
    tanggal=$(date +"%Y%m%d")
    wget -O "levi_$tanggal.jpg" "https://i.pinimg.com/564x/0d/a7/a1/0da7a17b89ea6ee5b62a7eee2f7af31b.jpg"
}

#fungsi untuk mendownload foto Eren
download_foto_eren() {
    tanggal=$(date +"%Y%m%d")
    wget -O "eren_$tanggal.jpg" "https://i.pinimg.com/564x/66/96/dc/6696dc04a235984e905a88c2607c7ffe.jpg"
}

#memeriksa karakter yang terakhir diunduh
if [[ -f ~/.last_downloaded ]]; then
    last_downloaded=$(cat ~/.last_downloaded)
else
    last_downloaded=""
fi

if [[ "$last_downloaded" == "levi" ]]; then
    download_foto_eren
    echo "Download foto Eren"
    echo "eren" > ~/.last_downloaded
else
    download_foto_levi
    echo "Downloaded foto Levi"
    echo "levi" > ~/.last_downloaded
fi
