#!/bin/bash

pkm_csv_file="resources/data-pkm.csv"

# Read user input
# echo "Please enter a first name: "
# read name

# Use awk to extract the first word from each row and check if it matches the user input
awk -F, -v name="$name" '{ split($2, a, "_"); if (a[1] == name) { print "Match found: " name } }' "$pkm_csv_file"

echo "Read password: "
read password
# awk -F, -v password="$password" '{split($4, a, " "); split($6, b, " "); gsub(/[()]/, "", b[length(b)]); 
# Menjalankan perintah awk dalam subshell dan menyimpan outputnya dalam satu variabel
# Menjalankan perintah awk dalam subshell dan menyimpan outputnya dalam satu variabel
result=($(awk -F, '{
    split($4, a, " "); split($6, b, " "); gsub(/[()]/, "", b[length(b)]); 
}' "$pkm_csv_file"))

if result==$(echo "$password" | awk '{print ($0=="mysecretpassword")}'); then
  echo "Match found: $password"
else
  echo "Password not found or incorrect: $password."
fi
# echo "Read password: "
# read -r password

# Menghapus spasi di depan dan belakang password (jika perlu)
# password=$(echo "$password" | awk '{$1=$1;print}')

# Membandingkan hasil awk dengan password
# if [[ "$result" == "$password" ]]; then
#   echo "Match found: $password"
# else
#   echo "Password not found or incorrect: $password." 
# fi




#logic read first name

# IFS=$'\n'
# array=($(awk -F, '{split($2, a, "_"); print a[1]}' "$pkm_csv_file"))
# for word in "${array[@]}"; do
#   echo "$word"
# done

# logic read 'FakultasNIDP'
# IFS=$'\n'
# array=($(awk -F, '{split($4, a, " "); split($6, b, " "); gsub(/[()]/, "", b[length(b)]); printf("%s%s\n", a[1], b[length(b)])}' "$pkm_csv_file"))
# for word in "${array[@]}"; do
#   echo "$word"
# done