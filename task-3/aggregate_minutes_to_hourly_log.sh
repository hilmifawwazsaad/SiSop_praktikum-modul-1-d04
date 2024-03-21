# #!/bin/bash

# # Directory containing individual log files
# log_dir="/home/$(whoami)/metrics"

# # Change permissions for log files
# # chmod -R a+rw "$log_dir"/*.log

# # Function to aggregate log files
# aggregate_logs() {
#   local log_dir="$1"
#   local hour="$2"

#   # Check if the log directory exists
#   if [ ! -d "$log_dir" ]; then
#     echo "Log directory '$log_dir' not found."
#     return
#   fi

#   # Get all log files in the directory
#   local log_files=("$log_dir"/metrics_*.log)

#   # Check if there are log files available
#   if [ ${#log_files[@]} -eq 0 ]; then
#     echo "No log files found in '$log_dir'."
#     return
#   fi

#   # Initialize arrays to store metric values
#   declare -A metrics

#   # Process each log file
#   for file in "${log_files[@]}"; do
#     # Read the second line of the file
#     read -r _ values < "$file"
#     IFS=',' read -r -a metrics_values <<< "$values"

#     # Initialize metric arrays if not yet initialized
#     for ((i = 0; i < ${#metrics_values[@]}; i++)); do
#       metric_name=${metrics_values[$i]}
#       metrics["$metric_name"]=1
#       metrics["$metric_name"+"_min"]=99999999
#       metrics["$metric_name"+"_max"]=-1
#       metrics["$metric_name"+"_sum"]=0
#       metrics["$metric_name"+"_count"]=0
#     done

#     # Read the values from the third line onwards
#     tail -n +3 "$file" | while IFS=',' read -r values; do
#       IFS=',' read -r -a metrics_values <<< "$values"
#       for ((i = 0; i < ${#metrics_values[@]}; i++)); do
#         metric_name=${metrics_values[$i]}
#         value=${metrics_values[$i]}
#         # Update metric values
#         metrics["$metric_name"+"_min"]=$(awk "BEGIN{print (${metrics["$metric_name"+"_min"]} < $value) ? ${metrics["$metric_name"+"_min"]} : $value}")
#         metrics["$metric_name"+"_max"]=$(awk "BEGIN{print (${metrics["$metric_name"+"_max"]} > $value) ? ${metrics["$metric_name"+"_max"]} : $value}")
#         ((metrics["$metric_name"+"_sum"] += value))
#         ((metrics["$metric_name"+"_count"]++))
#       done
#     done
#   done

#   # Write aggregated metrics to file
#   agg_file="$log_dir/metrics_agg_${hour}.log"
#   echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "$agg_file"
#   for metric_name in "${!metrics[@]}"; do
#     if [[ $metric_name != *"_min" && $metric_name != *"_max" && $metric_name != *"_sum" && $metric_name != *"_count" ]]; then
#       type="average"
#       value=$(awk "BEGIN {print ${metrics["$metric_name"+"_sum"]} / ${metrics["$metric_name"+"_count"]}}")
#       echo "$type,${metrics["$metric_name"+"_min"]},${metrics["$metric_name"+"_max"]},$value" | sed "s#$metric_name#$hour#g" >> "$agg_file"
#     fi
#   done
# }

# # Get the current hour in YmdH format
# current_hour=$(date +"%Y%m%d%H")

# # Aggregate logs for the current hour
# aggregate_logs "$log_dir" "$current_hour"

#!/bin/bash

# Mendapatkan waktu saat ini
current_hour=$(date +'%Y%m%d%H')

# Mendapatkan list file log dari satu jam terakhir
log_files=$(ls /home/$USER/metrics/metrics_${current_hour}*.log)

# Inisialisasi nilai minimum dan maksimum
min_mem_total=999999
max_mem_total=0
min_mem_used=999999
max_mem_used=0
min_mem_free=999999
max_mem_free=0
min_mem_shared=999999
max_mem_shared=0
min_mem_buff=999999
max_mem_buff=0
min_mem_available=999999
max_mem_available=0
min_swap_total=999999
max_swap_total=0
min_swap_used=999999
max_swap_used=0
min_swap_free=999999
max_swap_free=0
min_path_size=999
max_path_size=0
total_records=0

# Memproses setiap file log
for file in $log_files; do
    # Membaca data dari file log
    while IFS=, read -r mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free path path_size; do
        ((total_records++))
        # Memperbarui nilai minimum dan maksimum
        if [[ $mem_total -lt $min_mem_total ]]; then
            min_mem_total=$mem_total
        fi
        if [[ $mem_total -gt $max_mem_total ]]; then
            max_mem_total=$mem_total
        fi
        if [[ $mem_used -lt $min_mem_used ]]; then
            min_mem_used=$mem_used
        fi
        if [[ $mem_used -gt $max_mem_used ]]; then
            max_mem_used=$mem_used
        fi
        if [[ $mem_free -lt $min_mem_free ]]; then
            min_mem_free=$mem_free
        fi
        if [[ $mem_free -gt $max_mem_free ]]; then
            max_mem_free=$mem_free
        fi
        if [[ $mem_shared -lt $min_mem_shared ]]; then
            min_mem_shared=$mem_shared
        fi
        if [[ $mem_shared -gt $max_mem_shared ]]; then
            max_mem_shared=$mem_shared
        fi
        if [[ $mem_buff -lt $min_mem_buff ]]; then
            min_mem_buff=$mem_buff
        fi
        if [[ $mem_buff -gt $max_mem_buff ]]; then
            max_mem_buff=$mem_buff
        fi
        if [[ $mem_available -lt $min_mem_available ]]; then
            min_mem_available=$mem_available
        fi
        if [[ $mem_available -gt $max_mem_available ]]; then
            max_mem_available=$mem_available
        fi
        if [[ $swap_total -lt $min_swap_total ]]; then
            min_swap_total=$swap_total
        fi
        if [[ $swap_total -gt $max_swap_total ]]; then
            max_swap_total=$swap_total
        fi
        if [[ $swap_used -lt $min_swap_used ]]; then
            min_swap_used=$swap_used
        fi
        if [[ $swap_used -gt $max_swap_used ]]; then
            max_swap_used=$swap_used
        fi
        if [[ $swap_free -lt $min_swap_free ]]; then
            min_swap_free=$swap_free
        fi
        if [[ $swap_free -gt $max_swap_free ]]; then
            max_swap_free=$swap_free
        fi
        # Konversi path_size ke MB
        path_size_mb=$(echo "scale=2; $path_size / 1024" | bc)
        if [[ $(echo "$path_size_mb < $min_path_size" | bc) -eq 1 ]]; then
            min_path_size=$path_size_mb
        fi
        if [[ $(echo "$path_size_mb > $max_path_size" | bc) -eq 1 ]]; then
            max_path_size=$path_size_mb
        fi
    done < $file
done

# Menghitung rata-rata
avg_mem_total=$(( (min_mem_total + max_mem_total) / 2 ))
avg_mem_used=$(( (min_mem_used + max_mem_used) / 2 ))
avg_mem_free=$(( (min_mem_free + max_mem_free) / 2 ))
avg_mem_shared=$(( (min_mem_shared + max_mem_shared) / 2 ))
avg_mem_buff=$(( (min_mem_buff + max_mem_buff) / 2 ))
avg_mem_available=$(( (min_mem_available + max_mem_available) / 2 ))
avg_swap_total=$(( (min_swap_total + max_swap_total) / 2 ))
avg_swap_used=$(( (min_swap_used + max_swap_used) / 2 ))
avg_swap_free=$(( (min_swap_free + max_swap_free) / 2 ))
avg_path_size=$(( (min_path_size + max_path_size) / 2 ))

# Menyimpan hasil aggregasi ke dalam file
echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > /home/$USER/metrics/metrics_agg_${current_hour}.log
echo "minimum,$min_mem_total,$min_mem_used,$min_mem_free,$min_mem_shared,$min_mem_buff,$min_mem_available,$min_swap_total,$min_swap_used,$min_swap_free,/home/$USER/test/,$min_path_size" >> /home/$USER/metrics/metrics_agg_${current_hour}.log
echo "maximum,$max_mem_total,$max_mem_used,$max_mem_free,$max_mem_shared,$max_mem_buff,$max_mem_available,$max_swap_total,$max_swap_used,$max_swap_free,/home/$USER/test/,$max_path_size" >> /home/$USER/metrics/metrics_agg_${current_hour}.log
echo "average,$avg_mem_total,$avg_mem_used,$avg_mem_free,$avg_mem_shared,$avg_mem_buff,$avg_mem_available,$avg_swap_total,$avg_swap_used,$avg_swap_free,/home/$USER/test/,$avg_path_size" >> /home/$USER/metrics/metrics_agg_${current_hour}.log
