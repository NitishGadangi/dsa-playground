#!/bin/bash

# Function to list all .playground files in the current directory
list_playgrounds() {
    playgrounds=(*.playground)
    if [ ${#playgrounds[@]} -eq 0 ]; then
        echo "No playground files found in the current directory."
        exit 1
    fi
    echo "Available playground files:"
    for i in "${!playgrounds[@]}"; do
        echo "$((i + 1)). ${playgrounds[i]}"
    done
}

# Function to open a playground file
open_playground() {
    file=$1

    if [ -z "$file" ]; then
        list_playgrounds
        read -p "Select a playground file by number or name: " choice

        # Check if input is a number and within range
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#playgrounds[@]}" ] && [ "$choice" -ge 1 ]; then
            file="${playgrounds[$((choice - 1))]}"
        else
            file="$choice" # Treat the input as a filename
        fi
    fi

    # Check if the file exists as a directory (for .playground packages)
    if [ -n "$file" ] && [ -d "$file" ]; then
        echo "Opening '$file' in Xcode..."
        open -a Xcode "$file"
    else
        echo "Playground file not found: $file"
        exit 1
    fi
}

# Function to restart Xcode and open a playground file
restart_playground() {
    file=$1

    echo "Restarting Xcode..."
    echo ""
    killall Xcode 2>/dev/null || echo "No running instances of Xcode found."

    open_playground "$file"
}

# Main script logic
case $1 in
    open)
        open_playground "$2"
        ;;
    restart)
        restart_playground "$2"
        ;;
    *)
        echo "Usage: $0 {open|restart} [filename]"
        ;;
esac
