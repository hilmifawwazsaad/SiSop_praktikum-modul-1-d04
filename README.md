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

* Memasukkan password. Password didapatkan dari fakultas+nipd_dosen_pendamping

**Jawab**

* Setiap percobaan login akan tercatat pada log.txt dengan format YY/MM/DD hh:mm:ss MESSAGE

**Jawab**

### Problem 2b
* Yuan juga ingin membuat file bash register bernama yu_register.sh untuk handle peserta baru yang ingin upload proposal. Data baru ini akan langsung disimpan dalam file .csv tersebut.

**Jawab**

* Memasukkan nama_pengusul, asal departemen, fakultas, judul proposal, dosen pendamping (nidn), skema pkm. (Sesuaikan dengan file .csv)

**Jawab**

* Setiap percobaan register akan tercatat pada log.txt dengan format YY/MM/DD hh:mm:ss MESSAGE

**Jawab**

### Problem 2c
* Yuan tidak ingin capek. Dia membuat automasi di file bash bernama yu_database.sh untuk dapat membuat file users.txt guna menyimpan username dan password dari para peserta
* File users.txt akan diupdate setiap 1 jam sekali

**Jawab**

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



