#!/bin/bash

# Lokasi file CSV
pkm_csv_file="resources/data-pkm.csv"
# Fungsi untuk mengekstrak nama dari file CSV
extract_names() {
    names=()
    IFS=$'\n'
    array=($(awk -F, '{split($2, a, "_"); print a[1]}' "$pkm_csv_file"))
    for word in "${array[@]}"; do
        names+=("$word")
    done
}

# Fungsi untuk mengekstrak password dari file CSV
extract_password() {
    passwords=()
    IFS=$'\n'
    array=($(awk -F, '{split($4, a, " "); split($6, b, " "); gsub(/[()]/, "", b[length(b)]); printf("%s%s\n", a[1], b[length(b)])}' "$pkm_csv_file"))
    for word in "${array[@]}"; do
        passwords+=("$word")
    done
}

# Fungsi untuk menulis nama dan password ke dalam file teks beserta timestamp
write_to_file() {
    output_file="task-2/output/users.txt"
    > $output_file  # Bersihkan file teks sebelum menambahkan data baru
    for ((i=0; i<${#names[@]}; i++)); do
        echo "$(date '+%Y-%m-%d %H:%M:%S'): ${names[$i]}, ${passwords[$i]}" >> $output_file
    done
}

extract_names
extract_password
write_to_file

echo "Data nama dan password telah berhasil diperbarui pada: $(date)"
