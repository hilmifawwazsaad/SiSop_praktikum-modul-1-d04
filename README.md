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
## Soal 1
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

## Soal 2
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

## Soal 3
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

## Soal 4
Isabel sedang LDR dengan pacarnya dan sangat rindu. Isabel ingin menyimpan semua foto-foto yang dikirim oleh pacarnya. Bantulah Isabel menyimpan gambar "Mingyu Seventeen”.
### Problem 4a
* Gambarnya di download setiap 5 jam sekali mulai dari saat script dijalankan dan memperhatikan waktu sekarang. Jika waktu genap, maka simpan foto sebanyak 5x. Jika waktu ganjil, maka simpan foto sebanyak 3x. (Contoh : pukul sekarang 12.38, maka pukul 12 adalah genap sehingga simpan foto sebanyak 5x).
**Jawab**
* Jika pukul menunjukkan 00.00, maka simpan foto sebanyak 10x.
**Jawab**
* File yang didownload memiliki format nama foto_NOMOR.FILE dengan NOMOR.FILE adalah urutan file yang download (foto_1, foto_2, dst)
**Jawab**
* File batch yang didownload akan dimasukkan ke dalam folder dengan format nama folder_NOMOR.FOLDER dengan NOMOR.FOLDER adalah urutan folder saat dibuat (folder_1, folder_2, dst)
**Jawab**

### Problem 4b
Isabel harus melakukan zip setiap 1 jam dengan nama zip ayang_NOMOR.ZIP dengan NOMOR.ZIP adalah urutan folder saat dibuat (ayang_1, ayang_2, dst). Yang di ZIP hanyalah folder dari soal di atas.

**Jawab**

### Problem 4c
Ternyata laptop Isabel masih penuh, bantulah dia untuk delete semua folder dan zip setiap hari pada pukul 02.00!

**Jawab**

### Problem 4d
* Untuk mengisi laptopnya kembali, Isabel ingin mendownload gambar Levi dan Eren secara bergantian setiap harinya
**Jawab**
* Jika Levi, maka nama file nya menjadi levi_YYYYMMDD (Dengan YYYYMMDD adalah tahun, bulan, dan tanggal gambar tersebut di download)
**Jawab**
* Jika Eren, maka nama file nya menjadi eren_YYYYMMDD (Dengan YYYYMMDD adalah tahun, bulan, dan tanggal gambar tersebut di download)
**Jawab**



