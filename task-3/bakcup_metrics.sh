#!/bin/bash

#mendapatkan waktu saat ini
current_date=$(date +'%Y%m%d')

#mendapatkan list file log aggregasi dari satu hari
log_files=$(ls /home/$USER/metrics/metrics_agg_${current_date}*.log)

#menggabungkan semua file log menjadi satu
cat $log_files > /home/$USER/metrics/metrics_agg_${current_date}.log

#mengompres file log menjadi file .gz
gzip /home/$USER/metrics/metrics_agg_${current_date}.log

#mengubah nama file hasil kompresi
mv /home/$USER/metrics/metrics_agg_${current_date}.log.gz /home/$USER/metrics/backup_metrics_${current_date}.gz

#menghapus file log asli setelah terkompres
rm $log_files
