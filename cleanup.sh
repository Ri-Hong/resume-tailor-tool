#!/bin/bash

# Cleanup script for LaTeX auxiliary files
# Removes compilation artifacts while keeping .tex and .pdf files
# Works in root directory and all subdirectories in applications/

echo "Cleaning LaTeX auxiliary files..."

# Function to clean LaTeX auxiliary files in a directory
clean_directory() {
    local dir="$1"
    if [ -d "$dir" ]; then
        echo "Cleaning: $dir"
        cd "$dir" || return
        rm -f *.aux
        rm -f *.log
        rm -f *.out
        rm -f *.synctex.gz
        rm -f *.fdb_latexmk
        rm -f *.fls
        rm -f *.toc
        rm -f *.lof
        rm -f *.lot
        rm -f *.bbl
        rm -f *.blg
        rm -f *.bcf
        rm -f *.run.xml
        cd - > /dev/null || return
    fi
}

# Get the script's directory (root of the repository)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Clean root directory
echo "Cleaning root directory..."
clean_directory "$SCRIPT_DIR"

# Clean all directories in applications/
if [ -d "$SCRIPT_DIR/applications" ]; then
    echo "Cleaning all directories in applications/..."
    # Find all directories in applications/ and clean each one
    find "$SCRIPT_DIR/applications" -type d | while read -r dir; do
        clean_directory "$dir"
    done
fi

echo "Cleanup complete! Auxiliary files removed."
echo "Note: .tex and .pdf files are preserved."

