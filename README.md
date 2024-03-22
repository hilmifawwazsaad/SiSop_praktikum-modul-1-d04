[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/nyzv0V02)
<div align=center>

|    NRP     |      Name      |
| :--------: | :------------: |
| 5025221007 | Yehezkiella Felicia Jeis Timbulong |
| 5025221047 | Muhammad Rayyaan Fatikhahur Rakhim |
| 5025221103 | Hilmi Fawwaz Sa'ad |

# Praktikum Modul 1 _(Module 1 Lab Work)_

</div>

### Daftar Soal _(Task List)_

- [Task 1 - Tim Kawal Bubu _(Bubu's Monitoring Team)_](/task-1/)

- [Task 2 - Gabut Yuan _(Yuan's Boredom)_](/task-2/)

- [Task 3 - Magang Bubu _(Bubu's Internship)_](/task-3/)

- [Task 4 - LDR Isabel _(Isabel Sad Relationship)_](/task-4/)

### Laporan Resmi Praktikum Modul 1 _(Module 1 Lab Work Report)_

Tulis laporan resmi di sini!

_Write your lab work report here!_
## 1️⃣ Soal 1
Setelah masa upload proposal PKM 2024, Bubu sebagai sebagai anggota tim kawal melakukan scraping data upload dan mendapat file dalam format comma separated value (.csv). Bubu Pun mengirimkan file tersebut ke komandan PKM, namun komandan memiliki kesulitan untuk membaca data tersebut. Beliau mendelegasikan Bubu untuk menganalisis data tersebut. Karena kamu adalah Suhu dalam perlinux-an menurut Bubu maka ia spontan membuat challenge untukmu mengerjakan task tersebut seluruhnya menggunakan shell scripting.
### Problem 1a
Karena Belmawa menetapkan judul maksimum proposal 20 kata, maka komandan ingin mencari data siapa saja tim yang tidak memenuhi ketentuan ini. Tampilkan nama pengusul, beserta departemennya yang judulnya lebih dari 20 kata. Pisahkan spasi dan hapus underscore "_" pada nama pengusul.

**Jawab**

### Problem 1b
Komandan PKM juga tertarik ingin tahu antusiasme dan partisipasi mahasiswa sehingga meminta Bubu menampilkan bidang paling banyak diminati oleh mahasiswa. Tampilkan nama skema saja.

**Jawab**

### Problem 1c
arena ada aturan baru dimana 1 mahasiswa hanya boleh submit 1 proposal, maka komandan juga meminta Bubu untuk memberikan list mahasiswa yang mengajukan 2 proposal. Tampilkan data pembimbingnya karena ingin di kontak komandan.

**Jawab**

### Kendala

## 2️⃣ Soal 2
Yuan sedang gabut dan lagi makan toge. Setelah kenyang, dia ingin menambah suatu kerjaan baru. Dia sebagai panitia KSN ingin membuat suatu website yang handle login dan register untuk proposal PKM. File yang digunakan sama seperti di nomor 1
### Problem 2a
* Yuan ingin membuat file bash login bernama yu_login.sh untuk memastikan bahwa peserta yang telah ada di dalam file .csv tersebut, dapat langsung melakukan login, tanpa perlu register. Apabila loginnya sukses, maka akan masuk ke log.txt
* Memasukkan username. Username didapatkan dari kata pertama pada kolom nama_pengusul

**Jawab**
*
#!/bin/bash

pkm_csv_file="resources/data-pkm.csv"

# Read user input
echo "Please enter a first name: "
read name

echo "Please enter a password: "
read password

time_input=$(date '+%m/%d/%Y %H:%M:%S')

# Use awk to check if the name and password match the user input
login_attempt=$(awk -F, -v name="$name" -v password="$password" 'BEGIN { found=0 } {
    split($2, a, "_");
    split($4, b, " "); split($6, c, " "); gsub(/[()]/, "", c[length(c)]);
    combined_string = b[1] c[length(c)];
    if (a[1] == name && combined_string == password) {
        print "LOGIN: SUCCESS " name " is logged in";
        found=1;
        exit; # Exit from awk after finding the first match
    }
} END {
    if (found == 0) {
        print "LOGIN: ERROR Failed login attempt on " nama;
    }
}' "$pkm_csv_file")


# Write awk output and current date/time to the output file
echo "$time_input" "$login_attempt" >> task-2/output/log.txt

* Username : NUR

* Memasukkan password. Password didapatkan dari fakultas+nipd_dosen_pendamping

**Jawab**
FTIRS0029119304

* Setiap percobaan login akan tercatat pada log.txt dengan format YY/MM/DD hh:mm:ss MESSAGE

**Jawab**
Nama dan password ditemukan: NUR FTIRS0029119304
Nama atau password gada: NUR FTIRS002911930
03/22/2024 01:51:42
Nama dan password ditemukan: NUR FTIRS0029119304
03/22/2024 01:54:53 LOGIN: SUCCESS NUR is logged in
LOGIN: SUCCESS NUR is logged in
03/22/2024 02:05:53 LOGIN: SUCCESS NUR is logged in
03/22/2024 02:06:27 LOGIN: SUCCESS NUR is logged in


### Problem 2b
* Yuan juga ingin membuat file bash register bernama yu_register.sh untuk handle peserta baru yang ingin upload proposal. Data baru ini akan langsung disimpan dalam file .csv tersebut.

**Jawab**

#!/bin/bash

# Ask for input
echo "Enter data, separated by commas (No.,Nama_Pengusul,Departemen,Fakultas,Judul,Pendamping,Skema):"
read -a input_data

# Check if the CSV file exists, if not, create it
touch resources/data-pkm.csv

# Check if user already exists in the CSV file
user_data=$(echo "${input_text}\n" | sed 's/ //g; s/,/ /g')
  # Convert input data to space-separated string
if grep -qi ${input_data[1]} resources/data-pkm.csv; then
    echo "$(date '+%m/%d/%Y %H:%M:%S') REGISTER: ERROR ${input_data[1]} already existed" >> task-2/output/log_reg.txt
    exit 1
fi
echo "${input_data[*]}" >> resources/data-pkm.csv

# Print success message
echo "$(date '+%m/%d/%Y %H:%M:%S') REGISTER: SUCCESS ${input_data[1]} is registered. Proposal ${input_data[0]} is added" >> task-2/output/log_reg.txt




* Memasukkan nama_pengusul, asal departemen, fakultas, judul proposal, dosen pendamping (nidn), skema pkm. (Sesuaikan dengan file .csv)

**Jawab**

Ahmad_Sodik_Zainuddin, S1 Fisika, FSAD, Efektivitas Nikel pada Katoda Baterai Natrium-ion Na(Li0.2Ni0.8)O2 dengan Pelapisan Oksida Grafena Tereduksi Berbahan Dasar Biomassa Tempurung Kelapa, MOCHAMAD ZAINURI (0030016403), PKM-RE

* Setiap percobaan register akan tercatat pada log.txt dengan format YY/MM/DD hh:mm:ss MESSAGE

**Jawab**

REGISTER: ERROR User is already existed
REGISTER: ERROR User is already existed (date '+%m/%d/%Y %H:%M:%S')
REGISTER: ERROR User is already existed (03/21/2024 13:54:38)
REGISTER: SUCCESS  is registered. Proposal 3, is added
03/21/2024 13:56:35) REGISTER: SUCCESS  is registered. Proposal 3, is added
03/21/2024 13:56:56 REGISTER: ERROR USER_NAME is already existed
03/21/2024 13:58:38 REGISTER: ERROR 1,[1] already existed
03/21/2024 13:58:53 REGISTER: ERROR 1,[2] already existed
03/21/2024 13:59:12 REGISTER: ERROR tc, already existed
03/21/2024 13:59:34 REGISTER: ERROR Rayyan, already existed
03/21/2024 14:00:28 REGISTER: SUCCESS fwz, is registered. Proposal 5, is added
03/21/2024 20:55:15 REGISTER: ERROR Fisika already existed
03/21/2024 20:56:03 REGISTER: ERROR Fisika already existed
03/21/2024 20:56:16 REGISTER: ERROR 1,Ahmad_Sodik_Zainuddin,S1 already existed
03/21/2024 20:56:40 REGISTER: ERROR 1,Ahmad_Sodik_Zainuddin,S1 already existed
03/21/2024 20:58:24 REGISTER: ERROR 1,Ahmad_Sodik_Zainuddin,S1 already existed
03/21/2024 21:03:14 REGISTER: ERROR 1,Ahmad_Sodik_Zainuddin,S1 already existed
03/21/2024 21:04:31 REGISTER: ERROR 1, already existed
03/21/2024 21:04:44 REGISTER: ERROR Ahmad_Sodik_Zainuddin, already existed
03/21/2024 21:05:52 REGISTER: SUCCESS Ahmad_Sodik_Zainuddi, is registered. Proposal 1, is added
03/21/2024 21:07:42 REGISTER: SUCCESS Ahmad_Sodik_Zainudd, is registered. Proposal 1, is added
03/21/2024 21:09:32 REGISTER: SUCCESS Ahmad_Sodik_Zainud, is registered. Proposal 1, is added
03/21/2024 21:14:13 REGISTER: ERROR Ahmad_Sodik_Zainud, already existed



### Problem 2c
* Yuan tidak ingin capek. Dia membuat automasi di file bash bernama yu_database.sh untuk dapat membuat file users.txt guna menyimpan username dan password dari para peserta
* File users.txt akan diupdate setiap 1 jam sekali

**Jawab**
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

users.txt

2024-03-22 02:11:59: Nama, FakultasPendamping
2024-03-22 02:11:59: Ahmad, FSAD0030016403
2024-03-22 02:12:00: Tsania, FSAD0022066013
2024-03-22 02:12:00: DAFA, FTSPK0014038007
2024-03-22 02:12:00: FARISHA, FDKBD0024066504
2024-03-22 02:12:00: Fauzan, FTSPK"
2024-03-22 02:12:00: HIMAWAN, FTSPK0030098909
2024-03-22 02:12:00: RIJAALUL, FTIRS1008088902
2024-03-22 02:12:00: Mario, FV0023057603
2024-03-22 02:12:00: MOCHAMAD, FTIRS0017116704
2024-03-22 02:12:00: FITRI, FTEIC0023017304
2024-03-22 02:12:00: YETI, FV0022119102
2024-03-22 02:12:00: MARSHELIA, FSAD0008046206
2024-03-22 02:12:00: NIKOLAS, FV0031077304
2024-03-22 02:12:00: Mahara, FSAD0008058401
2024-03-22 02:12:00: HASNA, FTEIC0027076708
2024-03-22 02:12:00: Rangga, FTEIC0023017304
2024-03-22 02:12:00: PUTRI, FSAD0017088805
2024-03-22 02:12:00: ASSYITHA, FSAD0011098901
2024-03-22 02:12:00: ARYA, FTEIC0010039701
2024-03-22 02:12:00: RAFI, FTEIC0016128704
2024-03-22 02:12:00: ANIL, FTSPK0004038301
2024-03-22 02:12:00: FIRDHA, FSAD0017116704
2024-03-22 02:12:00: FARAH, FTIRSPOLYURETHANE
2024-03-22 02:12:00: Muhammad, FTSPK0013027803
2024-03-22 02:12:00: CHESYA, FTK0021098403
2024-03-22 02:12:00: FIRMANSYAH, FTSPK0030059204
2024-03-22 02:12:00: LAILA, FV0022119102
2024-03-22 02:12:00: Rahma, FSAD"
2024-03-22 02:12:00: CHRISTOPHER, FDKBD0021028302
2024-03-22 02:12:00: NAILA, FSAD0017088805
2024-03-22 02:12:00: AKBAR, FV0002049206
2024-03-22 02:12:00: DYAH, FSAD0004049503
2024-03-22 02:12:00: MUHAMMAD, FTIRS0017116704
2024-03-22 02:12:00: Moh., FTEIC0006028701
2024-03-22 02:12:00: THARIQ, FTIRS0710078802
2024-03-22 02:12:00: TALITHA, FSAD"
2024-03-22 02:12:00: NUR, FTSPK"
2024-03-22 02:12:00: Reynafa, FV0008075805
2024-03-22 02:12:00: Fatimah, FSAD0022059102
2024-03-22 02:12:00: MUHAMAD, FTIRS0028129203
2024-03-22 02:12:00: ILHAM, FSAD0022066013
2024-03-22 02:12:00: Ristiya, FV0014128701
2024-03-22 02:12:00: ADMIRAL, FTIRS0022097808
2024-03-22 02:12:00: DELLA, FTSPK0030059204
2024-03-22 02:12:00: MOCH., FTEIC0022049502
2024-03-22 02:12:00: ATHAYA, FV0704078201
2024-03-22 02:12:00: Sholahus, FSAD0028018104
2024-03-22 02:12:00: TRIO, FV0008039401
2024-03-22 02:12:00: Aldo, FTEICPengobatan
2024-03-22 02:12:00: Patrick, FSADCandi
2024-03-22 02:12:00: IRBAH, FTK0016046406
2024-03-22 02:12:00: Tegar, FTIRS0026079001
2024-03-22 02:12:00: NANDA, FDKBD0007089106
2024-03-22 02:12:00: YOGA, FV0018088801
2024-03-22 02:12:00: NARPHATI, FTIRS0007107302
2024-03-22 02:12:00: Selfira, FV0002059602
2024-03-22 02:12:00: Imam, FSAD0004026208
2024-03-22 02:12:00: ARYA, FTSPK0013057104
2024-03-22 02:12:00: Ina, FSAD0010129102
2024-03-22 02:12:00: NABILAH, FSAD0002059602
2024-03-22 02:12:00: AHMAD, FSAD0017117406
2024-03-22 02:12:00: DEANY, FSAD0008098902
2024-03-22 02:12:00: AISYAH, FV0008038307
2024-03-22 02:12:00: BHISMA, FTIRS0006107601
2024-03-22 02:12:00: TEPY, FV0002049206
2024-03-22 02:12:00: MAULANA, FV0026039401
2024-03-22 02:12:00: FADHILLA, FTSPK0023057505
2024-03-22 02:12:00: MUHAMMAD, FTIRS0017107404
2024-03-22 02:12:00: DAFFA`, FTIRS0007107302
2024-03-22 02:12:00: Ilhami, FTEIC0008118801
2024-03-22 02:12:00: Ahmad, FV0007089103
2024-03-22 02:12:00: Krisna, FV0008038307
2024-03-22 02:12:00: Muhammad, FTEIC0008118801
2024-03-22 02:12:00: GIANA, FTSPK0031077304
2024-03-22 02:12:00: NI, FV0701109301
2024-03-22 02:12:00: OLIVIA, FTSPK0003029206
2024-03-22 02:12:00: Riska, FSAD0025018107
2024-03-22 02:12:00: Ghifari, FTEIC0028057205
2024-03-22 02:12:00: MUSTIKA, FTK0005117103
2024-03-22 02:12:00: FIRZA, FTSPK0012058004
2024-03-22 02:12:00: MAHILA, FTEIC0029088201
2024-03-22 02:12:00: Adlan, FTEIC0007019004
2024-03-22 02:12:00: Shafa, FTSPK0003069005
2024-03-22 02:12:00: HARUNA, FV0022119102
2024-03-22 02:12:00: MUHAMMAD, FV0010039701
2024-03-22 02:12:00: Ardelia, FTSPK0012068901
2024-03-22 02:12:00: Irma, FSAD0013069302
2024-03-22 02:12:00: NABILA, FV0026038202
2024-03-22 02:12:00: Denurta, FV0013119201
2024-03-22 02:12:00: ANDIAR, FTEIC0029119304
2024-03-22 02:12:00: Rifqi, FTEIC0016068703
2024-03-22 02:12:00: RADITYA, FSAD0016066409
2024-03-22 02:12:00: ZUFAR, FSAD0016069006
2024-03-22 02:12:00: Agustinus, FV0013118906
2024-03-22 02:12:00: IQBAL, FSAD0024078002
2024-03-22 02:12:00: Anindya, FTSPK0013027803
2024-03-22 02:12:00: Muhammad, FTIRS0006107601
2024-03-22 02:12:00: KHAIRIN, FSAD0025047104
2024-03-22 02:12:00: Muhammad, FTSPK0012068901
2024-03-22 02:12:00: INDIRA, FSAD0008097508
2024-03-22 02:12:00: ZAHROTUL, FV0022119102
2024-03-22 02:12:00: Saurizha, FV0002049206
2024-03-22 02:12:00: MIFTAHUL, FTIRS0030075903
2024-03-22 02:12:00: ABIYYU, FTSPK0012068901
2024-03-22 02:12:00: M., FTIRS0021029003
2024-03-22 02:12:00: ALIFFIA, FTEIC0017079501
2024-03-22 02:12:00: Zalfaa, FV"
2024-03-22 02:12:00: ALFINDA, FV0706049102
2024-03-22 02:12:00: DIMAS, FTEIC0713088702
2024-03-22 02:12:00: AGUS, FSAD0007096906
2024-03-22 02:12:00: IZZA, FTEIC0011107607
2024-03-22 02:12:00: RICK, FTSPK0011109204
2024-03-22 02:12:01: Azizah, FTSPK0012058004
2024-03-22 02:12:01: REGINA, FTEIC0007019004
2024-03-22 02:12:01: Muhammad, FV0027075908
2024-03-22 02:12:01: MUHAMAD, FV0023099009
2024-03-22 02:12:01: MUHAMMAD, FTEIC0005018109
2024-03-22 02:12:01: RAMADA, FTIRS0025079006
2024-03-22 02:12:01: Tiffany, FVpH
2024-03-22 02:12:01: Muhammad, FTEIC0026079401
2024-03-22 02:12:01: NUR, FTSPK0004038705
2024-03-22 02:12:01: MOCHAMAD, FTSPK0013027803
2024-03-22 02:12:01: Ratu, FSAD0030118003
2024-03-22 02:12:01: IRFAN, FV0001027806
2024-03-22 02:12:01: CHRISTIAN, FV0013069302
2024-03-22 02:12:01: Farhana, FSAD0022097808
2024-03-22 02:12:01: NADHILA, FV0007089103
2024-03-22 02:12:01: R, FK0008099404
2024-03-22 02:12:01: Damario, FTSPK0023118710
2024-03-22 02:12:01: Hana, FTSPK0004038301
2024-03-22 02:12:01: YUDI, FV0003059301
2024-03-22 02:12:01: ACHMAD, FV0018088801
2024-03-22 02:12:01: SARAH, FTSPK0005077902
2024-03-22 02:12:01: GHUNAWAN, FTIRS0007107302
2024-03-22 02:12:01: MUHAMMAD, FTIRS0016129701
2024-03-22 02:12:01: SAFIRA, FSAD0014107303
2024-03-22 02:12:01: ERIK, FV0002049206
2024-03-22 02:12:01: Irgi, FTEIC0014027803
2024-03-22 02:12:01: I, FTIRS0010108402
2024-03-22 02:12:01: I, FTIRS0025038102
2024-03-22 02:12:01: MARDYA, FV0002049206
2024-03-22 02:12:01: Dhiya, FTIRS0020109305
2024-03-22 02:12:01: MUHAMMAD, FTIRS0008066404
2024-03-22 02:12:01: Nur, FV0030059303
2024-03-22 02:12:01: IGNATIUS, FTEIC0007019004
2024-03-22 02:12:01: BAGUS, FV0002049206
2024-03-22 02:12:01: Muhammad, FTEIC0017108506
2024-03-22 02:12:01: Citra, FTIRS0021106104
2024-03-22 02:12:01: Arya, FTEIC0006028701
2024-03-22 02:12:01: Isnuansa, FTEIC0008118801
2024-03-22 02:12:01: DIO, FTK0023016504
2024-03-22 02:12:01: I, FTEIC0010099003
2024-03-22 02:12:01: Ghozi, FTEIC0019078607
2024-03-22 02:12:01: MUHAMMAD, FV0010039701
2024-03-22 02:12:01: MAULANA, FTK0003089601
2024-03-22 02:12:01: Mohammad, FSAD0020067603
2024-03-22 02:12:01: Mochammad, FV0010039701
2024-03-22 02:12:01: Nisaul, FTIRS0022097808
2024-03-22 02:12:01: Vicky, FTSPK0012058004
2024-03-22 02:12:01: ARIF, FTIRS0022097808
2024-03-22 02:12:01: SHABRINA, FTEIC0018026604
2024-03-22 02:12:01: RAFI, FV0008075805
2024-03-22 02:12:01: ANDIKA, FTEIC0727038508
2024-03-22 02:12:01: Muhammad, FV0706119201
2024-03-22 02:12:01: LILA, FTSPK0012058004
2024-03-22 02:12:01: Anifatihatul, FSAD0016086113
2024-03-22 02:12:01: LINTANG, FV0706049102
2024-03-22 02:12:01: I, FTIRS0016129701
2024-03-22 02:12:01: Tatik, FV0008109602
2024-03-22 02:12:01: MUHAMMAD, FTIRS0026079001
2024-03-22 02:12:01: Hanan, FSAD0025047104
2024-03-22 02:12:01: DELIA, FTIRS0005056508
2024-03-22 02:12:01: Eka, FTSPK0013027803
2024-03-22 02:12:01: AHMAD, FTEIC0713088702
2024-03-22 02:12:01: Farsya, FTEIC0014059402
2024-03-22 02:12:01: NASIB, FSAD0014109404
2024-03-22 02:12:01: Mu`afa, FTEIC0007019004
2024-03-22 02:12:01: Muhammad, FTIRS0028129203
2024-03-22 02:12:01: DELA, FSAD0022066013
2024-03-22 02:12:01: ROCHMAN, FTIRS0026079001
2024-03-22 02:12:01: ARIF, FTSPK0025059004
2024-03-22 02:12:01: TSANA, FSAD0016128813
2024-03-22 02:12:01: PIPIT, FV0021068002
2024-03-22 02:12:01: ADE, FV0008075805
2024-03-22 02:12:01: LINTANG, FTK0015119006
2024-03-22 02:12:01: BHIRAWA, FDKBD0003069401
2024-03-22 02:12:01: Betria, FTIRS0001017026
2024-03-22 02:12:01: HANI, FTSPK0030059204
2024-03-22 02:12:01: KHALISA, FTSPK0025029305
2024-03-22 02:12:01: Rajni, FSAD0004056209
2024-03-22 02:12:01: ZEVA, FSAD0022066013
2024-03-22 02:12:01: Shabrina, FTK0010086806
2024-03-22 02:12:01: YUSUF, FTIRS0021029003
2024-03-22 02:12:01: RONALDO, FTSPK"
2024-03-22 02:12:01: PUTRI, FV0030059303
2024-03-22 02:12:01: Putri, FTSPK0012068901
2024-03-22 02:12:01: WAHYU, FV0021046109
2024-03-22 02:12:01: CICILIA, FSAD0025047104
2024-03-22 02:12:01: FAIRUZ, FSAD0007128702
2024-03-22 02:12:01: FARELLA, FTSPK"
2024-03-22 02:12:01: David, FTIRS0029016004
2024-03-22 02:12:01: OMAR, FTSPKREGRESSION
2024-03-22 02:12:01: Salsabila, FV0013118906
2024-03-22 02:12:01: Intan, FSAD0009088103
2024-03-22 02:12:01: Fadhil, FSAD0020059503
2024-03-22 02:12:01: Marsyada, FV0008075805
2024-03-22 02:12:01: DARRELL, FTIRS0017107404
2024-03-22 02:12:01: MUHAMMAD, FV0704078201
2024-03-22 02:12:01: MUTHIUTTHORIQ, FTIRS0021029003
2024-03-22 02:12:01: KHANSA, FDKBD0011128801
2024-03-22 02:12:01: SHABRINA, FTSPK0030059204
2024-03-22 02:12:01: Isna, FTEIC0005098101
2024-03-22 02:12:01: HAYKAL, FV0023108401
2024-03-22 02:12:01: EFRA, FTIRS0021106104
2024-03-22 02:12:01: Hafizah, FTIRS0003097404
2024-03-22 02:12:01: KURNIAWAN, FV0010077305
2024-03-22 02:12:01: Yudistira, FTIRS0017088903
2024-03-22 02:12:01: Rangga, FSAD"
2024-03-22 02:12:01: Husna, FTIRS0710078802
2024-03-22 02:12:01: PATRICIA, FTIRS0014027803
2024-03-22 02:12:01: Lazuardi, FTEIC0025127005
2024-03-22 02:12:01: Lili, FSAD0014107303
2024-03-22 02:12:01: DAFFA, FV0010039701
2024-03-22 02:12:01: SAFIN, FV0013118906
2024-03-22 02:12:01: TRIWANTO, FSAD0011098901
2024-03-22 02:12:01: ZIDAN, FTIRS0021029003
2024-03-22 02:12:01: Maghfiroh, FSAD0017106903
2024-03-22 02:12:01: CHRISTOPHORUS, FTIRS0009069101
2024-03-22 02:12:01: MUHAMMAD, FTSPK0001017026
2024-03-22 02:12:01: Fysna, FTEIC0001096508
2024-03-22 02:12:02: Muhammad, FTIRS0001096012
2024-03-22 02:12:02: SHAFFA, FK0017108506
2024-03-22 02:12:02: SITI, FV0008099404
2024-03-22 02:12:02: M., FTEIC0022129207
2024-03-22 02:12:02: Yenni, FTSPK0018058601
2024-03-22 02:12:02: Muhammad, FTIRS0021029003
2024-03-22 02:12:02: YUNIAR, FSAD0028018104
2024-03-22 02:12:02: MUKHAMMAD, FTSPK0010099003
2024-03-22 02:12:02: ALFEN, FTSPK0029129302
2024-03-22 02:12:02: Muhamad, FTSPK0030059204
2024-03-22 02:12:02: DONA, FTSPK0013027803
2024-03-22 02:12:02: KIKI, FTSPK0005077902
2024-03-22 02:12:02: Muhammad, FTIRS0021029003
2024-03-22 02:12:02: FITRIYA, FTIRS0001017026
2024-03-22 02:12:02: Dila, FSAD0030016403
2024-03-22 02:12:02: ABDA, FSAD0028018104
2024-03-22 02:12:02: ENGGAR, FSAD0013069302
2024-03-22 02:12:02: Devy, FTIRS0710078802
2024-03-22 02:12:02: OSAMA, FSAD0016069006
2024-03-22 02:12:02: MUHAMMAD, FTIRS0026079001
2024-03-22 02:12:02: MONICA, FVTensimeter
2024-03-22 02:12:02: Abdillah, FSAD0012126909
2024-03-22 02:12:02: MOHAMMAD, FTK0024039302
2024-03-22 02:12:02: Fatimah, FDKBD0021028302
2024-03-22 02:12:02: QUEENA, FV0002059602
2024-03-22 02:12:02: JEASMINE, FTK0006088301
2024-03-22 02:12:02: Meisy, FSAD0004026208
2024-03-22 02:12:02: RADITIA, FTIRS0020058004
2024-03-22 02:12:02: NARA, FTIRS0710078802
2024-03-22 02:12:02: ABIYYU, FV0030049103
2024-03-22 02:12:02: JOHNATHAN, FDKBD0026078805
2024-03-22 02:12:02: DASHA, FTEIC0022129207
2024-03-22 02:12:02: Bella, FSAD0009088103
2024-03-22 02:12:02: JOSE, FTEIC0007019004
2024-03-22 02:12:02: REGINA, FDKBD0021079601
2024-03-22 02:12:02: LAZUARDINI, FTSPK0030059601
2024-03-22 02:12:02: KAYLA, FTSPK0003029206
2024-03-22 02:12:02: KOMANG, FTIRS0002049206
2024-03-22 02:12:02: KHALIDA, FSAD0014128701
2024-03-22 02:12:02: EREN, FSAD0701109301
2024-03-22 02:12:02: Danang, FTSPK0004028607
2024-03-22 02:12:02: DWI, FSAD0006039002
2024-03-22 02:12:02: MUHAMMAD, FTEIC0010099003
2024-03-22 02:12:02: Revelyno, FTEIC0022129207
2024-03-22 02:12:02: MOCH., FTIRSGgfbs
2024-03-22 02:12:02: MUHAMMAD, FSAD"
2024-03-22 02:12:02: Farhan, FTEIC0007019004
2024-03-22 02:12:02: HIKMATIAR, FTIRS0017107404
2024-03-22 02:12:02: FELICIA, FTEIC0716118801
2024-03-22 02:12:02: Kevin, FTIRS0001096012
2024-03-22 02:12:02: EKO, FTIRS0017088903
2024-03-22 02:12:02: Tsalits, FTSPKoleh
2024-03-22 02:12:02: INDAH, FSAD0022066013
2024-03-22 02:12:02: ARDHEA, FV0002049206
2024-03-22 02:12:02: Candra, FTSPK0005077902
2024-03-22 02:12:02: ARDI, FSAD0022066013
2024-03-22 02:12:02: Amaliah, FSADTelur
2024-03-22 02:12:02: REGINA, FTIRS0001096012
2024-03-22 02:12:02: OCEAN, FTIRS0017116704
2024-03-22 02:12:02: DIKA, FV0030059303
2024-03-22 02:12:02: SEPTIKA, FSAD0025056009
2024-03-22 02:12:02: MUHAMMAD, FTIRS0013028905
2024-03-22 02:12:02: Iqbal, FTEIC0025098901
2024-03-22 02:12:02: AURA, FTEIC0017107404
2024-03-22 02:12:02: ANDINI, FV0706119201
2024-03-22 02:12:02: HEBERT, FTEIC0002096405
2024-03-22 02:12:02: FALSYABILLAH, FSAD0026079001
2024-03-22 02:12:02: Faizin, FV0010069101
2024-03-22 02:12:02: Samuel, FTIRS0010028202
2024-03-22 02:12:02: MUHAMMAD, FTEIC0013098401
2024-03-22 02:12:02: ALIF, FTEIC0716118801
2024-03-22 02:12:02: Alexandro, FTEIC0015029503
2024-03-22 02:12:02: Ayu, FSAD0002027910
2024-03-22 02:12:02: ADINDA, FTEIC0002096405
2024-03-22 02:12:02: FARINDA, FSAD0014066904
2024-03-22 02:12:02: NI, FTIRS0706049102
2024-03-22 02:12:02: FERDY, FSAD0013069302
2024-03-22 02:12:02: AISYAH, FTIRS0003076606
2024-03-22 02:12:02: DZAKKI, FV0002059602
2024-03-22 02:12:02: Yosefine, FTEIC0002096405
2024-03-22 02:12:02: JIHADUL, FTSPK0028108302
2024-03-22 02:12:02: Alfuad, FV"
2024-03-22 02:12:02: MOCHAMMAD, FV0017039402
2024-03-22 02:12:02: ANANDA, FSAD0028018104
2024-03-22 02:12:02: NIROGA, FDKBD0021028302
2024-03-22 02:12:02: Citra, FV0027075908
2024-03-22 02:12:02: LEILA, FV0008075805
2024-03-22 02:12:02: MUHAMMAD, FTIRSCocofiber
2024-03-22 02:12:02: Julian, FTIRS0027068004
2024-03-22 02:12:02: DWI, FTSPK0011019101
2024-03-22 02:12:02: RENALDI, FV0030059303
2024-03-22 02:12:02: MUHAMMAD, FTEIC0013108907
2024-03-22 02:12:02: AURA, FSAD0025047104
2024-03-22 02:12:02: I, FTSPK0005069401
2024-03-22 02:12:02: MUHAMMAD, FSAD0022097808
2024-03-22 02:12:02: Rara, FSADTambaksari
2024-03-22 02:12:02: ANUGERAH, FTIRS0029119304
2024-03-22 02:12:02: ADI, FTSPK0012017408
2024-03-22 02:12:02: Joseph, FTSPK0023069204
2024-03-22 02:12:02: NAILAH, FTSPK0012058004
2024-03-22 02:12:02: Mohammad, FV0022119102
2024-03-22 02:12:02: RAFFI, FV0003059301
2024-03-22 02:12:02: MUHAMMAD, FSAD0016069006
2024-03-22 02:12:02: HERLANI, FSAD0013069302
2024-03-22 02:12:02: RIFQI, FTIRSpH
2024-03-22 02:12:02: Tharisha, FSAD0003076606
2024-03-22 02:12:03: RANGGA, FV0016128704
2024-03-22 02:12:03: ABDUL, FV0022119102
2024-03-22 02:12:03: Milkha, FTSPK0028108302
2024-03-22 02:12:03: Shinta, FV0011128801
2024-03-22 02:12:03: Nugraha, FSAD0010048902
2024-03-22 02:12:03: PUDAK, FDKBD0008109602
2024-03-22 02:12:03: AULY, FSAD0004049503
2024-03-22 02:12:03: Ahmad, FTEIC0012077006
2024-03-22 02:12:03: Jasmine, FSAD0014109404
2024-03-22 02:12:03: ALIFAH, FTIRS0022097808
2024-03-22 02:12:03: CHINTYA, FV0021079009
2024-03-22 02:12:03: KHALISHA, FTSPK0005077902
2024-03-22 02:12:03: FIKI, FTSPK0006059201
2024-03-22 02:12:03: ACHMAD, FV0030059303
2024-03-22 02:12:03: Inzus, FSAD0022066013
2024-03-22 02:12:03: AGUNG, FSAD0021067007
2024-03-22 02:12:03: WAFIRAH, FSAD0003066507
2024-03-22 02:12:03: MUHAMMAD, FTIRS0017116704
2024-03-22 02:12:03: Abdul, FV0010039701
2024-03-22 02:12:03: Febriana, FV0022119102
2024-03-22 02:12:03: NADYAH, FTSPK0013027803
2024-03-22 02:12:03: GHERIYA, FDKBD0016128501
2024-03-22 02:12:03: RAFI, FTK0010086806
2024-03-22 02:12:03: SALSABILLA, FV0027075908
2024-03-22 02:12:03: Ahmad, FTSPK0013027803
2024-03-22 02:12:03: ABDUL, FSAD0008098902
2024-03-22 02:12:03: Dwi, FV0027075908
2024-03-22 02:12:03: Muhammad, FSAD0011098901
2024-03-22 02:12:03: Nuansa, FSAD0011098901
2024-03-22 02:12:03: Istiazah, FSAD0022097808
2024-03-22 02:12:03: ZALFA, FSAD0001098504
2024-03-22 02:12:03: MOHCHAMMAD, FV0706119201
2024-03-22 02:12:03: AURELIA, FSAD0011098901
2024-03-22 02:12:03: AUDYA, FV0023099009
2024-03-22 02:12:03: KURNIA, FTIRS0619019501
2024-03-22 02:12:03: NAOMI, FTSPK0010049801
2024-03-22 02:12:03: NAUFAL, FSAD"
2024-03-22 02:12:03: ZENISA, FSAD0016086113
2024-03-22 02:12:03: Bahrul, FTSPK0027097208
2024-03-22 02:12:03: THERESIA, FSAD0017106903
2024-03-22 02:12:03: Arif, FTIRSEkonomis
2024-03-22 02:12:03: SEKAR, FSAD0006066107
2024-03-22 02:12:03: GALIH, FTIRS0025079006
2024-03-22 02:12:03: Saka, FV0009069004
2024-03-22 02:12:03: MUHAMMAD, FSAD0011098901
2024-03-22 02:12:03: Adetiasyah, FVProbolinggo
2024-03-22 02:12:03: Hanin, FTIRS0001096012
2024-03-22 02:12:03: Muhammad, FTIRS0026058206
2024-03-22 02:12:03: LATHIFATUS, FTK0005117103
2024-03-22 02:12:03: Fatimah, FTSPK0012058004
2024-03-22 02:12:03: AMANDA, FV0002059602
2024-03-22 02:12:03: ADITYA, FTEIC0025038105
2024-03-22 02:12:03: Reynaldi, FTSPK0013027803
2024-03-22 02:12:03: Nafian, FTEIC0007107302
2024-03-22 02:12:03: SADA, FV0022119102
2024-03-22 02:12:03: Roger, FTIRS0024077901
2024-03-22 02:12:03: REYHAN, FTIRS0007107302
2024-03-22 02:12:03: M., FTIRS0029127908
2024-03-22 02:12:03: RAPHAEL, FTK0010057505
2024-03-22 02:12:03: AMELIA, FTSPK0011128801
2024-03-22 02:12:03: TOBING, FV0023108401
2024-03-22 02:12:03: AHMAD, FTSPK0001038703
2024-03-22 02:12:03: JIHAD, FV0030059303
2024-03-22 02:12:03: ISTIGHFAROH, FSAD0014107303
2024-03-22 02:12:03: GREGORY, FTIRS0710078802
2024-03-22 02:12:03: PURWO, FTIRS0002059602
2024-03-22 02:12:03: Fatkhulil, FV0706119201
2024-03-22 02:12:03: BUNGA, FSAD0011098901
2024-03-22 02:12:03: JIRYAN, FSAD0705018801
2024-03-22 02:12:03: HAPPY, FTIRS0003097404
2024-03-22 02:12:03: BINTANG, FV0030059601
2024-03-22 02:12:03: ELANG, FTIRS0007107302
2024-03-22 02:12:03: BYRLIANTY, FV0002059602
2024-03-22 02:12:03: Naufal, FTIRS0710078802
2024-03-22 02:12:03: Riga, FSAD0011098901
2024-03-22 02:12:03: ARDA, FV0030059303
2024-03-22 02:12:03: Raphael, FTIRS0003097404
2024-03-22 02:12:03: YUSTIA, FV0016089204
2024-03-22 02:12:03: Rivansyah, FTEIC0028058001
2024-03-22 02:12:03: Nazilla, FTSPK0003108401
2024-03-22 02:12:03: VALENT, FTSPK0012069003
2024-03-22 02:12:03: MAHARANI, FV0023108401
2024-03-22 02:12:03: NAILA, FTSPK0020056106
2024-03-22 02:12:03: GIFFANI, FSAD0013037105
2024-03-22 02:12:03: Sukma, FTEIC0003068004
2024-03-22 02:12:03: BRELLYAN, FV0010039701
2024-03-22 02:12:03: HANIFAH, FSAD0013069302
2024-03-22 02:12:03: Chandra, FTIRSMesin
2024-03-22 02:12:03: SHAFIRA, FTIRS0028129203
2024-03-22 02:12:03: MUHAMMAD, FSAD0025049302
2024-03-22 02:12:03: Christopher, FTEIC0013027002
2024-03-22 02:12:03: Prameswari, FTK0027037902
2024-03-22 02:12:03: MUHAMMAD, FV0010039701
2024-03-22 02:12:03: NAURA, FTSPK0005077902
2024-03-22 02:12:03: Aisyah, FTSPK0013027803
2024-03-22 02:12:03: Sifra, FSAD0013069302
2024-03-22 02:12:03: Nazia, FSAD0010078105
2024-03-22 02:12:03: Rizqi, FSAD0011098901
2024-03-22 02:12:03: Ilzam, FTSPK0012058004
2024-03-22 02:12:03: IGNETIA, FSAD0025018107
2024-03-22 02:12:03: HANDIKA, FV0017128909
2024-03-22 02:12:03: BERLIAND, FTEIC0008118801
2024-03-22 02:12:03: AMILATUS, FSAD0014107303
2024-03-22 02:12:03: ADITYA, FTSPK0015049801
2024-03-22 02:12:03: TIARA, FTSPK0018089001
2024-03-22 02:12:03: RAFI, FTEIC0022066013
2024-03-22 02:12:03: KEMALA, FV0008075805
2024-03-22 02:12:03: ALVANZA, FSAD0010048902
2024-03-22 02:12:03: FARHAN, FV0008109602
2024-03-22 02:12:03: TALITA, FK0007107302
2024-03-22 02:12:04: ROZAN, FV0022119102
2024-03-22 02:12:04: JUNATHAN, FTEIC0028047104
2024-03-22 02:12:04: ANTONIA, FDKBD0013108907
2024-03-22 02:12:04: Sofi, FTSPK0009017701
2024-03-22 02:12:04: KATHERINA, FTEIC0007097404
2024-03-22 02:12:04: Safitri, FTSPK0029129302
2024-03-22 02:12:04: MOHAMMAD, FSAD0013069302
2024-03-22 02:12:04: Bintang, FTEIC0025098901
2024-03-22 02:12:04: OWIGA, FDKBD0021028302
2024-03-22 02:12:04: RIFKY, FV0706049102
2024-03-22 02:12:04: Althea, FV0706049102
2024-03-22 02:12:04: Mohammad, FSAD0020069107
2024-03-22 02:12:04: Yuliana, FSAD0015017502
2024-03-22 02:12:04: HERA, FTK0015097108
2024-03-22 02:12:04: Muhammad, FV0027075908
2024-03-22 02:12:04: FEBRIAN, FV0704128501
2024-03-22 02:12:04: DIANA, FV0022119102
2024-03-22 02:12:04: Achmad, FV0010039701
2024-03-22 02:12:04: Bihar, FSAD0024098303
2024-03-22 02:12:04: ASTRI, FTSPK0018089001
2024-03-22 02:12:04: Shafira, FDKBD0003069401
2024-03-22 02:12:04: LIVETA, FTSPK0002047807
2024-03-22 02:12:04: M, FV0023108401
2024-03-22 02:12:04: THARIQ, FTEIC0727038508
2024-03-22 02:12:04: YUDHADARMA, FTIRS0013017802
2024-03-22 02:12:04: Naila, FTSPK0013027803
2024-03-22 02:12:04: ADDIEN, FSAD0007027203
2024-03-22 02:12:04: Fathor, FV0023108401
2024-03-22 02:12:04: ZULFA, FSAD0013069302
2024-03-22 02:12:04: Hanan, FSAD0701099201
2024-03-22 02:12:04: Bayu, FTEIC0027058305
2024-03-22 02:12:04: MUHAMMAD, FTIRS0003038204
2024-03-22 02:12:04: NUR, FTIRS0022097808
2024-03-22 02:12:04: NUR, FTIRS0029119304
2024-03-22 02:12:04:  Ahmad, FSAD0030016403
2024-03-22 02:12:04:  Ahmad, FSAD0030016403



### Kendala

## 3️⃣ Soal 3
Buatlah program monitoring resource pada setiap server. Cukup monitoring RAM dan monitoring size suatu directory. Untuk RAM gunakan command free -m. Untuk disk gunakan command du -sh <target_path>. Catat semua metrics yang didapatkan dari hasil free -m. Untuk hasil du -sh <target_path> catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/.
### Problem 3a
Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-30 15:00:00, maka file log yang akan tergenerate adalah metrics_20240330150000.log.

**Jawab**

### Problem 3b
Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis setiap menit.

**Jawab**

### Problem 3c
Kemudian, buat satu script untuk membuat aggregasi file log ke satuan jam. Script aggregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file aggregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File aggregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil aggregasi metrics_agg_2023033015.log dengan format metrics_agg_{YmdH}.log.

**Jawab**

### Problem 3d
Selanjutnya agar lebih menghemat penyimpan, buatlah script backup_metrics.sh. Dimana script ini akan menyimpan semua log metrics aggregasi mulai dari pukul 00:00 sampai 23:59 didalam 1 file .gz menggunakan gunzip. Contoh nama file hasil zip backup_metrics_{date_YmdH}.gz

**Jawab**

### Kendala

## 4️⃣ Soal 4
Isabel sedang LDR dengan pacarnya dan sangat rindu. Isabel ingin menyimpan semua foto-foto yang dikirim oleh pacarnya. Bantulah Isabel menyimpan gambar "Mingyu Seventeen”.
### Problem 4a
* Gambarnya di download setiap 5 jam sekali mulai dari saat script dijalankan dan memperhatikan waktu sekarang. Jika waktu genap, maka simpan foto sebanyak 5x. Jika waktu ganjil, maka simpan foto sebanyak 3x. (Contoh : pukul sekarang 12.38, maka pukul 12 adalah genap sehingga simpan foto sebanyak 5x).
* Jika pukul menunjukkan 00.00, maka simpan foto sebanyak 10x.
* File yang didownload memiliki format nama foto_NOMOR.FILE dengan NOMOR.FILE adalah urutan file yang download (foto_1, foto_2, dst)
* File batch yang didownload akan dimasukkan ke dalam folder dengan format nama folder_NOMOR.FOLDER dengan NOMOR.FOLDER adalah urutan folder saat dibuat (folder_1, folder_2, dst)

**Jawab**

Sebelumnya, kami menggunakan main function untuk mengeksekusi program 4a dengan bantuan argumen `4a`. Untuk soal selanjutnya juga menggunakan argumen 4b, 4c, dan 4d karena script dijalankan secara bersamaan dalam satu file isabel.sh

1. Di Main function mendeklarasikan waktu saat ini dan jumlah folder dengan pola increment dalam direktori saat ini
```bash
local current_hour=$(date +"%H")
local current_minute=$(date +"%M")
local last_folder_number=$(ls -d folder_* 2>/dev/null | wc -l)
local folder_counter=$((last_folder_number + 1))
```
Detail :
- `local` menunjukkan bahwa variabel tersebut hanya dapat diakses di dalam fungsi itu sendiri dan tidak akan terlihat di luar fungsi. Selain itu, juga untuk mencegah terjadinya konflik nama variabel
- `$(date + "%H)` untuk mendapatkan jam saat ini dari perintah `date`. Hasilnya akan disimpan dalam variabel lokal `current_hour`
- `$(date + "%M")` untuk mendapatkan menit saat ini dari perintah `date`. Hasilnya akan disimpan dalam variabel loka `current_minute`
- `ls -d folder_*` adalah perintah `ls` untuk mencari pola nama `folder_*`. `-d` digunakan untuk menampilkan nama direktori yang cocok dengan pola tersebut
- `2>/dev/null` adalah perintah untuk mengarahkan output dari standar error (stderr) ke `dev/null` yang merupakan sebuah perangkat yang digunakan untuk membuang data.
- `|` pipe operator untuk mengarahkan output dari perintah sebelumnya ke input perintah berikutnya
- `wc -l` (word count) digunakan untuk menghitung jumlah baris

2. Membuat fungsi di luar Main Function. Untuk fungsi pertama adalah fungsi untuk mengecek apakah waktu saat ini adalah jam genap
```bash
is_even() {
    local time=$1
    ((time % 2 == 0))
}
```
3. Fungsi kedua adalah fungsi untuk mengecek apakah waktu saat ini adalah tengah malam (00.00)
```bash
is_midnight() {
    local hour=$1
    local minute=$2
    [[ $hour -eq 0 && $minute -eq 0 ]]
}
```
Detail :
- `[[ $hour -eq 0 && $minute -eq 0 ]]` digunakan untuk mengecek apakah nilai variabel `hour` sama dengan 0 dan nilai variabel `minute` juga sama dengan 0. Jika kondisi benar, maka akan mengembalikan nilai true, Jika kondisi tidak sesuai, akan mengembalikan nilai false,

4. Fungsi ketiga adalah fungsi yang digunakan untuk mendownload foto 
```bash
download_photos() {
    local count=$1
    local folder=$2

    mkdir -p "$folder"
    for ((i=1; i<=$count; i++)); do
        wget --show-progress --progress=bar -q -O "$folder/foto_$i.jpg" "https://phinemo.com/wp-content/uploads/2017/02/hidup-bebas.jpg"
        echo "Download foto_$i.jpg ke $folder"
    done
}
```
Detail :
- `local count=$1` diinisialisasi dengan nilai dari parameter utama fungsi yang diasumsikan sebagai jumlah foto yang akan diunduh
- `local folder=$2` diinisalisasi dengan nilai dari parameter kedua fungsi yang merupakan nama folder sebagai tempat menyimpan foto
- `mkdir -p "$folder" untuk membuat direktori dengan nama yang disimpan dalam variabel `folder`. `-p` digunakan agar tidak ada error ketika direktori sudah ada
- `wget --show-progress --progress=bar -q -O "$folder/foto_$i.jpg"` memiliki command `wget` digunakan untuk mengunduh foto dari URL yang dicantumkan. Foto yang diunduh akan disimpan dalam format penamaan `foto_$i.jpg` dalam folder yang sudah ditentukan. Penamaan file ini dapat dikontrol karena terdapat `-O` dalam command tersebut
- `--show-progress --progresss=bar` digunakan untuk menampilkan progres pengunduhan dalam bentuk bar
- `-q` membuat `wget` berjalan dalam mode diam dan mengurangi pesan yang ditampilkan ke layar

5. Fungsi keempat adalah fungsi untuk melacak waktu terakhir eksekusi dan menyimpannya dalam variabel dan juga file.
```bash
#inisialisasi variabel last_execution_time
last_execution_time=0
#fungsi untuk mengupdate waktu eksekusi terakhir 
update_last_execution_time() {
    last_execution_time=$(date +%s)
    echo "$last_execution_time" > ~/.last_execution_time
    echo "Update waktu eksekusi terakhir: $(date)"
}
```
Detail :
- `%s` pada `$(date +%s)` digunakan untuk memformat output `date` agar mengembalikan waktu dalam format detik sejak Epoch. Epoch adalah waktu referensi dalam Unix yang biasanya dimulai pada 1 Januari 1970
- `echo "$last_execution_time" > ~/.last_execution_time` digunakan untuk menyimpan nilai `$last_execution_time` ke dalam file `~/.last_execution_time` dengan bantuan operator >. `~/`menunjukkan bahwa file berada di direktori home 

6. Selanjutnya kembali ke Main Function untuk melanjutkan program dari no 1. Di sini, kita mulai menggunakan parameter untuk mengeksekusi problem 4a. Parameter yang digunakan adalah `4a`
```bash
if [ "$1" = "4a" ]; then
        echo "Jam sekarang: $current_hour, Menit sekarang: $current_minute"
        if [[ -f ~/.last_execution_time ]]; then
            last_execution_time=$(cat ~/.last_execution_time)
            time_diff=$(( ( $(date +%s) - last_execution_time) / 3600 ))
        else
            time_diff=0
        fi
        #jika jam 00.00, download 10 foto
        if is_midnight "$current_hour" "$current_minute"; then
            folder_counter=$((folder_counter + 1))
            download_photos 10 "folder_$folder_counter"
            echo "Download 10 foto pada tengah malam (00.00)."
        else
            #jika perbedaan waktu adalah 5 jam, download 5 foto jika jamnya genap, 3 foto jika tidak
            if (( time_diff >= 5 )); then
                if is_even "$current_hour"; then
                    download_photos 5 "folder_$folder_counter"
                    echo "Download 5 foto pada jam genap."
                else
                    download_photos 3 "folder_$folder_counter"
                    echo "Download 3 foto pada jam ganjil."
                fi

                #update waktu eksekusi terakhir
                update_last_execution_time
            else
                echo "Tidak ada foto yang di download. Terakhir dijalankan $time_diff jam yang lalu."
            fi
        fi
```
Detail : 
- `-f` digunakan untuk mengecek apakah file `~/.last_execution_time` ada atau tidak
- `last_execution_time=$(cat ~/.last_execution_time)` untuk membaca nilai waktu terakhir yang disimpan di dalamnya dan menetapkannya ke dalam variabel `last_exexution_time` dengan command `cat`
- `time_diff=$(( ( $(date +%s) - last_execution_time) / 3600 ))` adalah perhitungan untuk menghitung selisih waktu antara waktu sekarang dan waktu eksekusi terakhir dalam jam
- `folder_counter=$((folder_counter + 1))` menunjukkan bahwa nilai folder_counter akan diincrement agar sesuai dengan folder baru yang akan dibuat
- `download_photos 10 "folder_$folder_counter"` pemanggilan fungsi `download_photos` untuk mengunduh 10 foto. Fungsi ini akan membuat folder baru dengan nama `folder_$folder_counter` (sesuai dengan nilai folder_counter yang baru diincrement) dan mengunduh 10 foto ke dalamnya
- Poin detail 4-5 akan berulang untuk kondisi setelah 5 jam sejak eksekusi terakhir. Untuk jam genap akan mendowload 5 foto, sedangkan jam ganjil mendownload 3 foto
- Pemanggilan fungsi `update_last_execution_time` untuk memperbarui waktu eksekusi terakhir

7. **Cronjob**. Disini kami menggunakan cron untuk menjalankan script `isabel.sh 4a` setiap satu jam sekali. Hal ini dikarenakan terdapat 2 kondisi yang harus terjadi. Kondisi pertama adalah mendownload foto setiap 5 jam sekali sesuai dengan jam saat ini (jam genap download 5 foto, jam ganjil download 3 foto). Kondisi kedua adalah setiap pukul 00.00 pasti mendownload 10 foto terlepas dari kondisi pertama
```bash
@hourly /bin/bash /home/hilmifawwaz/sisop/praktikum-modul-1-d04/task-4/isabel.sh 4a
```
Detail :
- `@hourly` menunjukkan bahwa argumen `4a` pada file `isabel.sh` dijalankan setiap satu jam sekali
- `/bin/bash` digunakan untuk menunjukkan bahwa perintah dijalankan dengan menggunakan shell bash
- `/home/hilmifawwaz/sisop/praktikum-modul-1-d04/task-4/isabel.sh 4a` menunjukkan path dari file `isabel.sh`.
- `4a` adalah argumen yang dijalankan dalam file `isabel.sh`

8. **Dokumentasi**
- Execute `isabel.sh 4a`
![alt text](image.png)
- Folder yang terbentuk
![alt text](image-1.png)
- Ketika execute belum memenuhi kondisi pertama dan kedua
![alt text](image-2.png)


### Problem 4b
Isabel harus melakukan zip setiap 1 jam dengan nama zip ayang_NOMOR.ZIP dengan NOMOR.ZIP adalah urutan folder saat dibuat (ayang_1, ayang_2, dst). Yang di ZIP hanyalah folder dari soal di atas.

**Jawab**

### Problem 4c
Ternyata laptop Isabel masih penuh, bantulah dia untuk delete semua folder dan zip setiap hari pada pukul 02.00!

**Jawab**

### Problem 4d
* Untuk mengisi laptopnya kembali, Isabel ingin mendownload gambar Levi dan Eren secara bergantian setiap harinya
* Jika Levi, maka nama file nya menjadi levi_YYYYMMDD (Dengan YYYYMMDD adalah tahun, bulan, dan tanggal gambar tersebut di download)
* Jika Eren, maka nama file nya menjadi eren_YYYYMMDD (Dengan YYYYMMDD adalah tahun, bulan, dan tanggal gambar tersebut di download)

**Jawab**

### Kendala



