#!/bin/bash

# --- Start of updated start.sh ---

# 1. Define PocketBase version and download URL
PB_VERSION="0.36.8"
PB_DOWNLOAD_URL="https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip"
PB_ZIP_FILE="pocketbase_${PB_VERSION}_linux_amd64.zip"
PB_EXE="pocketbase"

# 2. Download PocketBase if it doesn't exist or is the wrong version
if [ ! -f "$PB_EXE" ] || [ "$(./$PB_EXE version)" != "$PB_VERSION" ]; then
    echo "Downloading PocketBase v$PB_VERSION..."
    wget -q "$PB_DOWNLOAD_URL"
    unzip -q "$PB_ZIP_FILE"
    rm "$PB_ZIP_FILE"
    chmod +x "$PB_EXE" # Make executable right after download
else
    echo "PocketBase v$PB_VERSION already present and correct."
fi

# 3. Ensure necessary directories exist (these should be persistent if using Render's disk)
mkdir -p pb_data
mkdir -p pb_migrations

# 4. TEMPORARY PASSWORD RESET COMMAND
# YOU MUST REPLACE 'YOUR_NEW_STRONG_PASSWORD_HERE' with your actual new password!
echo "Attempting to reset PocketBase admin password..."
./$PB_EXE admin reset-password --email saumesht4075fea@gmail.com --password YOUR_NEW_STRONG_PASSWORD_HERE

# This temporary script will likely run the command and then exit.
# This is expected behavior for the password reset step.
# Once the password is reset, you MUST revert this file
# to its original 'serve' command and push again for normal operation.

# --- End of updated start.sh ---
