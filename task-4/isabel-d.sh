#!/bin/bash

#fungsi untuk download levi
download_foto_levi() {
    tanggal=$(date +"%Y%m%d")
    wget -O "levi_$tanggal.jpg" "https://i.pinimg.com/564x/0d/a7/a1/0da7a17b89ea6ee5b62a7eee2f7af31b.jpg"
}

#fungsi untuk download foto eren
download_foto_eren() {
    tanggal=$(date +"%Y%m%d")
    wget -O "eren_$tanggal.jpg" "https://i.pinimg.com/564x/66/96/dc/6696dc04a235984e905a88c2607c7ffe.jpg"
}

#mengecek apakah sekarang hari genap atau ganjil
tanggal=$(date +"%Y%m%d")
if ((tanggal % 2 == 0)); then
    download_foto_levi
else
    download_foto_eren
fi
