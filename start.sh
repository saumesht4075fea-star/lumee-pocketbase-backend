#!/bin/bash

# 1. Download PocketBase if it doesn't exist
if [ ! -f "pocketbase" ]; then
    echo "Downloading PocketBase..."
    # Get the latest Linux AMD64 version.
    # Check https://pocketbase.io/downloads/ for the correct URL for your desired version and OS/arch.
    PB_VERSION="0.36.8" # <--- UPDATED TO LATEST VERSION
    wget -q https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip
    unzip -q pocketbase_${PB_VERSION}_linux_amd64.zip
    rm pocketbase_${PB_VERSION}_linux_amd64.zip
fi

# 2. Make the executable
chmod +x pocketbase

# 3. Ensure necessary directories exist
mkdir -p pb_data
mkdir -p pb_migrations

# 4. Start PocketBase server
./pocketbase serve --http 0.0.0.0:${PORT} --automigrate
