#!/bin/bash

# Set target path
target_path="/home/$(whoami)/"

# Save path
save_path="/home/$(whoami)/metrics"

# Create path for save the log
mkdir -p "$save_path" || { echo "Failed to create directory $save_path"; exit 1; }

# Set log file name pattern
log_file_pattern="$save_path/metrics_$(date +"%Y%m%d%H%M%S").log"

# Function to log metrics
log_metrics() {
  # RAM usage metrics
  echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" >> "$log_file_pattern"
  free -m | awk -v target_path="$target_path" 'NR==2 {printf "%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%s\n", $2, $3, $4, $5, $6, $7, $8, $9, $10, target_path, $NF }' OFS=, >> "$log_file_pattern"

  # Disk usage metrics
  echo "Disk usage for path $target_path at $(date):" >> "$log_file_pattern"
  du -sh "$target_path" | awk -v target_path="$target_path" '{printf "%s,%s\n", target_path, $1 }' OFS=, >> "$log_file_pattern"
}

# Log metrics
log_metrics
