#!/bin/bash

# --- Start of new simplified start.sh ---

# 1. Define PocketBase version and executable name
PB_VERSION="0.36.8"
PB_EXE="pocketbase"

# 2. Remove any existing PocketBase executable to force a fresh download
echo "Ensuring no old PocketBase executable is present..."
rm -f "$PB_EXE"

# 3. Download PocketBase (ensuring correct URL and filename)
echo "Downloading PocketBase v$PB_VERSION..."
wget -q "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -O pb.zip
unzip -q pb.zip
rm pb.zip # Clean up the zip file

# 4. Make the downloaded executable runnable
chmod +x "$PB_EXE"

# 5. Ensure necessary directories exist
mkdir -p pb_data
mkdir -p pb_migrations

# 6. TEMPORARY PASSWORD RESET COMMAND
# YOU MUST REPLACE 'YOUR_NEW_STRONG_PASSWORD_HERE' with your actual new password!
echo "Attempting to reset PocketBase admin password with saumesht4075fea@gmail.com..."
# Check if the 'admin' command is even available in the downloaded binary
if "./$PB_EXE" --help | grep -q "admin"; then
    echo "PocketBase binary supports 'admin' command. Proceeding with reset."
    "./$PB_EXE" admin reset-password --email saumesht4075fea@gmail.com --password YOUR_NEW_STRONG_PASSWORD_HERE
else
    echo "ERROR: Downloaded PocketBase binary does NOT support 'admin' command. This is unexpected."
    exit 1 # Exit with an error to highlight the problem
fi

echo "Password reset command executed. This deployment is expected to exit early."

# --- End of new simplified start.sh ---
