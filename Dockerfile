# Start with a builder image that has git (often includes essential tools like curl, unzip)
FROM alpine/git:latest AS builder

# Set the working directory inside the builder stage
WORKDIR /app

# Copy your entire project context into the builder image
COPY . .

# Ensure start.sh is executable in the builder stage for any pre-build operations
RUN chmod +x start.sh

# Create the necessary PocketBase data directories
RUN mkdir -p pb_data
RUN mkdir -p pb_public

# Use a fresh, minimal Alpine image for the final production stage
FROM alpine:latest

# Install 'curl' and 'unzip' in the final image
# These are crucial for your start.sh script to download and extract PocketBase
RUN apk add --no-cache curl unzip

# Set the working directory for the final image
WORKDIR /app

# Copy the PocketBase executable (once it's downloaded by start.sh),
# the start.sh script, and the data directories from the builder stage
COPY --from=builder /app/pocketbase .
COPY --from=builder /app/start.sh .
# IMPORTANT: Ensure start.sh is executable AGAIN in the final image to preserve permissions
RUN chmod +x start.sh
COPY --from=builder /app/pb_data ./pb_data
COPY --from=builder /app/pb_public ./pb_public

# Expose the default PocketBase port. Render will use its own $PORT variable,
# but this is good practice for Docker images.
EXPOSE 8090

# Define the command to run when the container starts.
# This will execute your start.sh script.
CMD ["./start.sh"]
