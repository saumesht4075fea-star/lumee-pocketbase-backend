#!/bin/bash

# --- Start of new, more verbose start.sh for debugging ---

# 1. Define PocketBase version and executable name
PB_VERSION="0.36.8"
PB_EXE="pocketbase"

echo "Starting PocketBase setup process."

# 2. Remove any existing PocketBase executable to force a fresh download
echo "Step 2: Ensuring no old PocketBase executable is present..."
rm -f "$PB_EXE"
if [ -f "$PB_EXE" ]; then
    echo "Warning: Old PocketBase executable still exists after rm -f. Permissions issue?"
fi
echo "Current directory contents before download:"
ls -l

# 3. Download PocketBase (ensuring correct URL and filename)
echo "Step 3: Downloading PocketBase v$PB_VERSION from GitHub..."
wget -q "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -O pb.zip

if [ ! -f "pb.zip" ]; then
    echo "ERROR: pb.zip was not downloaded. Check URL or network issues."
    exit 1
fi
echo "Downloaded pb.zip. Size:"
ls -l pb.zip

# 4. Unzip the downloaded file
echo "Step 4: Unzipping pb.zip..."
unzip -q pb.zip

if [ ! -f "$PB_EXE" ]; then
    echo "ERROR: PocketBase executable not found after unzipping. Check zip contents or unzipping process."
    exit 1
fi
echo "Unzipped files. Contents after unzip:"
ls -l

rm pb.zip # Clean up the zip file

# 5. Make the downloaded executable runnable
echo "Step 5: Making PocketBase executable..."
chmod +x "$PB_EXE"
echo "Permissions after chmod:"
ls -l "$PB_EXE"

# 6. Ensure necessary directories exist
echo "Step 6: Ensuring pb_data and pb_migrations directories exist..."
mkdir -p pb_data
mkdir -p pb_migrations

# 7. TEMPORARY PASSWORD RESET COMMAND
# YOU MUST REPLACE 'YOUR_NEW_STRONG_PASSWORD_HERE' with your actual new password!
echo "Step 7: Attempting to reset PocketBase admin password with saumesht4075fea@gmail.com..."

# Check if the 'admin' command is even available in the downloaded binary
if "./$PB_EXE" --help | grep -q "admin"; then
    echo "PocketBase binary supports 'admin' command. Proceeding with reset."
    "./$PB_EXE" admin reset-password --email saumesht4075fea@gmail.com --password YOUR_NEW_STRONG_PASSWORD_HERE
    echo "Password reset command executed. This deployment is expected to exit early."
else
    echo "ERROR: Downloaded PocketBase binary does NOT support 'admin' command. This is highly unexpected. Full --help output:"
    "./$PB_EXE" --help
    exit 1 # Exit with an error to highlight the problem
fi

# --- End of new, more verbose start.sh for debugging ---#!/bin/bash

# --- Start of new, more verbose start.sh for debugging ---

# 1. Define PocketBase version and executable name
PB_VERSION="0.36.8"
PB_EXE="pocketbase"

echo "Starting PocketBase setup process."

# 2. Remove any existing PocketBase executable to force a fresh download
echo "Step 2: Ensuring no old PocketBase executable is present..."
rm -f "$PB_EXE"
if [ -f "$PB_EXE" ]; then
    echo "Warning: Old PocketBase executable still exists after rm -f. Permissions issue?"
fi
echo "Current directory contents before download:"
ls -l

# 3. Download PocketBase (ensuring correct URL and filename)
echo "Step 3: Downloading PocketBase v$PB_VERSION from GitHub..."
wget -q "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -O pb.zip

if [ ! -f "pb.zip" ]; then
    echo "ERROR: pb.zip was not downloaded. Check URL or network issues."
    exit 1
fi
echo "Downloaded pb.zip. Size:"
ls -l pb.zip

# 4. Unzip the downloaded file
echo "Step 4: Unzipping pb.zip..."
unzip -q pb.zip

if [ ! -f "$PB_EXE" ]; then
    echo "ERROR: PocketBase executable not found after unzipping. Check zip contents or unzipping process."
    exit 1
fi
echo "Unzipped files. Contents after unzip:"
ls -l

rm pb.zip # Clean up the zip file

# 5. Make the downloaded executable runnable
echo "Step 5: Making PocketBase executable..."
chmod +x "$PB_EXE"
echo "Permissions after chmod:"
ls -l "$PB_EXE"

# 6. Ensure necessary directories exist
echo "Step 6: Ensuring pb_data and pb_migrations directories exist..."
mkdir -p pb_data
mkdir -p pb_migrations

# 7. TEMPORARY PASSWORD RESET COMMAND
# YOU MUST REPLACE MyStrongPass123! with your actual new password!
echo "Step 7: Attempting to reset PocketBase admin password with saumesht4075fea@gmail.com..."

# Check if the 'admin' command is even available in the downloaded binary
if "./$PB_EXE" --help | grep -q "admin"; then
    echo "PocketBase binary supports 'admin' command. Proceeding with reset."
    "./$PB_EXE" admin reset-password --email saumesht4075fea@gmail.com --password YOUR_NEW_STRONG_PASSWORD_HERE
    echo "Password reset command executed. This deployment is expected to exit early."
else
    echo "ERROR: Downloaded PocketBase binary does NOT support 'admin' command. This is highly unexpected. Full --help output:"
    "./$PB_EXE" --help
    exit 1 # Exit with an error to highlight the problem
fi

# --- End of new, more verbose start.sh for debugging ---
