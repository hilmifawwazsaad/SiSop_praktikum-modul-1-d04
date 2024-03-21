# #!/bin/bash

# # Set the directory containing the aggregated metrics log files
# log_directory="/home/$(whoami)/metrics"

# # Set the filename pattern for aggregation files
# aggregation_pattern="metrics_agg_*.log"

# # Find all aggregation files matching the filename pattern
# aggregation_files=("$log_directory"/$aggregation_pattern)

# # Check if aggregation files exist
# if [[ ${#aggregation_files[@]} -eq 0 ]]; then
#     echo "No aggregation files found matching the pattern: $aggregation_pattern"
#     exit 1
# fi

# # Set the name for the backup .gz file
# backup_file="$log_directory/backup_metrics_$(date +"%Y%m%d%H%M%S").gz"

# # Create a temporary directory to hold uncompressed aggregation files
# temp_dir=$(mktemp -d)

# # Copy aggregation files to the temporary directory
# for file in "${aggregation_files[@]}"; do
#     cp "$file" "$temp_dir"
# done

# # Compress the aggregation files into a single .gz file
# tar -czf "$backup_file" -C "$temp_dir" .

# # Remove the temporary directory
# rm -rf "$temp_dir"

# echo "Backup file created: $backup_file"
# Mendapatkan waktu saat ini
current_date=$(date +'%Y%m%d')

# Mendapatkan list file log aggregasi dari satu hari
log_files=$(ls /home/$USER/metrics/metrics_agg_${current_date}*.log)

# Menggabungkan semua file log menjadi satu
cat $log_files > /home/$USER/metrics/metrics_agg_${current_date}.log

# Mengompres file log menjadi file .gz
gzip /home/$USER/metrics/metrics_agg_${current_date}.log

# Mengubah nama file hasil kompresi
mv /home/$USER/metrics/metrics_agg_${current_date}.log.gz /home/$USER/metrics/backup_metrics_${current_date}.gz

# Menghapus file log asli setelah terkompres
rm $log_files
