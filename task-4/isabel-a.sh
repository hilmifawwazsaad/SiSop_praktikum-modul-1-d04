#!/bin/bash

# Function to download photos
download_photos() {
    local count=$1
    local folder=$2

    mkdir -p "$folder"
    for ((i=1; i<=$count; i++)); do
        # Use direct image URLs for downloading photos
        wget --show-progress --progress=bar -q -O "$folder/foto_$i.jpg" "https://phinemo.com/wp-content/uploads/2017/02/hidup-bebas.jpg"
        echo "Downloaded foto_$i.jpg to $folder"
    done
}

# Function to check if current time is even
is_even() {
    local time=$1
    ((time % 2 == 0))
}

# Function to check if current time is 00:00
is_midnight() {
    local hour=$1
    local minute=$2
    [[ $hour -eq 0 && $minute -eq 0 ]]
}

# Variable to store the last execution time
#last_execution_time=0

# Function to get the last execution time
#get_last_execution_time() {
#    echo "$last_execution_time"
#}

# Function to update the last execution time
update_last_execution_time() {
    last_execution_time=$(date +%s)
    echo "Last execution time updated: $(date)"
}

# Main function
main() {
    local current_hour=$(date +"%H")
    local current_minute=$(date +"%M")
    local last_folder_number=$(ls -d folder_* 2>/dev/null | wc -l)
    local folder_counter=$((last_folder_number + 1))

    echo "Current hour: $current_hour, Current minute: $current_minute"

    # Get the last execution time
    #local last_execution=$(get_last_execution_time)
    #echo "Last execution time: $(date -d @$last_execution)"

    # Calculate the time difference in hours
    local time_diff=$(( ( $(date +%s) - last_execution ) / 3600 ))

    # If it's midnight, download 10 photos
    if is_midnight "$current_hour" "$current_minute"; then
        folder_counter=$((folder_counter + 1))
        download_photos 10 "folder_$folder_counter"
        echo "Downloaded 10 photos at midnight."
    else
        # If the time difference is greater than or equal to 5 hours, proceed with the execution
        if (( time_diff >= 5 )); then
            if is_even "$current_hour"; then
                download_photos 5 "folder_$folder_counter"
                echo "Downloaded 5 photos at even hour."
            else
                download_photos 3 "folder_$folder_counter"
                echo "Downloaded 3 photos at odd hour."
            fi

            # Update the last execution time
            update_last_execution_time
        else
            echo "No action taken. Exiting."
        fi
    fi
}

main
