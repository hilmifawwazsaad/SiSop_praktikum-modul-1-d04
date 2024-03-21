#!/bin/bash

#fungsi untuk mendownload foto
download_photos() {
    local count=$1
    local folder=$2

    mkdir -p "$folder"
    for ((i=1; i<=$count; i++)); do
        wget --show-progress --progress=bar -q -O "$folder/foto_$i.jpg" "https://phinemo.com/wp-content/uploads/2017/02/hidup-bebas.jpg"
        echo "Download foto_$i.jpg ke $folder"
    done
}

#fungsi untuk mengecek apakah waktu (jam) adalah genap
is_even() {
    local time=$1
    ((time % 2 == 0))
}

#fungsi untuk mengecek apakah waktu (jam) adalah tengah malam
is_midnight() {
    local hour=$1
    local minute=$2
    [[ $hour -eq 0 && $minute -eq 0 ]]
}

#variabel untuk menyimpan waktu terakhir eksekusi
last_execution_time=0

#fungsi untuk mendapatkan waktu terakhir eksekusi
#get_last_execution_time() {
#    echo "$last_execution_time"
#}

#fungsi untuk mengupdate waktu terakhir eksekusi
update_last_execution_time() {
    last_execution_time=$(date +%s)
    echo "Update waktu eksekusi terakhir: $(date)"
}

# Main function
main() {
    local current_hour=$(date +"%H")
    local current_minute=$(date +"%M")
    local last_folder_number=$(ls -d folder_* 2>/dev/null | wc -l)
    local folder_counter=$((last_folder_number + 1))

    echo "Jam sekarang: $current_hour, Menit sekarang: $current_minute"

    # Get the last execution time
    #local last_execution=$(get_last_execution_time)
    #echo "Last execution time: $(date -d @$last_execution)"

    #kalkulasi selisih waktu
    local time_diff=$(( ( $(date +%s) - last_execution ) / 3600 ))

    #jika waktu adalah tengah malam, download 10 foto
    if is_midnight "$current_hour" "$current_minute"; then
        folder_counter=$((folder_counter + 1))
        download_photos 10 "folder_$folder_counter"
        echo "Download 10 foto pada tengah malam (00.00)."
    else
        #jika selisih waktu lebih dari 5 jam, download 5 foto jika jam genap, 3 foto jika jam ganjil
        if (( time_diff >= 5 )); then
            if is_even "$current_hour"; then
                download_photos 5 "folder_$folder_counter"
                echo "Download 5 foto pada jam genap."
            else
                download_photos 3 "folder_$folder_counter"
                echo "Download 3 foto pada jam ganjil."
            fi

            #update waktu terakhir eksekusi
            update_last_execution_time
        else
            echo "Tidak ada foto yang di download. Terakhir dijalankan $time_diff jam yang lalu."
        fi
    fi
}

main
