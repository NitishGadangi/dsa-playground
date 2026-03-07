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
        read -e -p "Select a playground file by number or name: " choice

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

    echo "Reopening '$file' in 1 second..."
    sleep 1
    open_playground "$file"
}

# Function to create a new page in a playground
create_page() {
    list_playgrounds
    read -p "Select a playground file by number or name: " choice

    # Resolve playground file
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#playgrounds[@]}" ] && [ "$choice" -ge 1 ]; then
        file="${playgrounds[$((choice - 1))]}"
    else
        file="$choice"
    fi

    if [ ! -d "$file" ]; then
        echo "Playground not found: $file"
        exit 1
    fi

    read -e -p "Enter the new page name: " page_name
    if [ -z "$page_name" ]; then
        echo "Page name cannot be empty."
        exit 1
    fi

    read -p "Do you want to restart Xcode (quit -> create -> reopen)? (y/n): " restart_choice

    if [[ "$restart_choice" =~ ^[Yy]$ ]]; then
        echo "Quitting Xcode..."
        killall Xcode 2>/dev/null || echo "No running instances of Xcode found."
    fi

    # Create Pages directory if it doesn't exist
    mkdir -p "$file/Pages"

    page_dir="$file/Pages/$page_name.xcplaygroundpage"
    if [ -d "$page_dir" ]; then
        echo "Page '$page_name' already exists in '$file'."
        exit 1
    fi

    mkdir -p "$page_dir"

    # Create Contents.swift
    cat > "$page_dir/Contents.swift" <<EOF
import Foundation

// Auto-generated-page
EOF

    echo "Created page '$page_name' in '$file'."

    if [[ "$restart_choice" =~ ^[Yy]$ ]]; then
        echo "Reopening '$file' in 1 second..."
        sleep 1
        open_playground "$file"
    fi
}

# Main script logic
case $1 in
    open)
        open_playground "$2"
        ;;
    restart)
        restart_playground "$2"
        ;;
    create)
        create_page
        ;;
    *)
        echo "Usage: $0 {open|restart|create} [filename]"
        ;;
esac
