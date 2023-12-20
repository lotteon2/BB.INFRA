#!/bin/bash

# Set the name of the output compressed file
output_file="/Users/nowgnas/lotteon/javascript.zip"

# Set the source directory containing files to compress
source_dir="/Users/nowgnas/lotteon/javascript"

# Navigate to the source directory
cd "$source_dir" || exit

# Use zip to compress files
zip -r "$output_file" .

echo "Compression completed. Compressed file: $output_file"
