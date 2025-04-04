#!/bin/bash

# --- Configuration ---
# Define the directory to scan (default: current directory)
SOURCE_DIR="${1:-.}"

# --- Token Patterns (Example - expand this!) ---
TOKEN_PATTERNS=(
  "API_KEY=[A-Za-z0-9]{32}"  # Example: API_KEY=... (32 chars)
  "sk_[A-Za-z0-9]{32}"       # Example: sk_... (32 chars)
  "[A-Za-z0-9]{8}"       # Example: sk_... (32 chars)
  "[0-9a-fA-F]{32,64}"       # Hexadecimal strings (32-64 chars) - could be many things, be careful
  "password=[^'\"]+"        # Example: password=... (anything after equals, until quote)
)

# --- Functions ---
scan_file() {
  local file="$1"
  echo -e "\e[32mScanning: $file\e[0m"
  for pattern in "${TOKEN_PATTERNS[@]}"; do
    if grep -qE "$pattern" "$file"; then
      grep -nE "$pattern" "$file" | while read -r line; do
        echo -e "\e[31m  Potential token found in $file: $line\e[0m" # Make this red
      done
    fi
  done
}

# --- Main ---
export -f scan_file
find "$SOURCE_DIR" -type f -print0 | git -C "$SOURCE_DIR" ls-files -z --exclude-standard | xargs -0 -I {} bash -c '
  scan_file "$1"
' -- {}
echo -e "\e[32mScan complete.\e[0m"
