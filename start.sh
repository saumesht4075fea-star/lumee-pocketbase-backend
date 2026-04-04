# 7. PASSWORD RESET COMMAND (USING 'superuser' upsert)
# The password will be set to MyStrongPass123!
echo "Step 7: Attempting to create/upsert PocketBase superuser with saumesht4075fea@gmail.com..."

if "./$PB_EXE" --help | grep -q "superuser"; then
    echo "PocketBase binary supports 'superuser' command. Proceeding with upsert."
    # Use 'upsert' to create or update the superuser
    "./$PB_EXE" superuser upsert saumesht4075fea@gmail.com MyStrongPass123!
    echo "Superuser upsert command executed."
else
    echo "ERROR: Downloaded PocketBase binary does NOT support 'superuser' command. This is unexpected for v0.36.8. Full --help output from '$PB_EXE --help':"
    "./$PB_EXE" --help
    echo "Also checking version via '$PB_EXE --version':"
    "./$PB_EXE" --version
    exit 1 # Exit with an error if for some reason 'superuser' is missing
fi

# 8. Start PocketBase (assuming superuser upsert is done)
echo "Step 8: Starting PocketBase server..."
exec "./$PB_EXE" serve --http "0.0.0.0:$PORT" --dir "pb_data"
