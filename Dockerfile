# Start with a builder image that has git (often includes essential tools like curl, unzip)
FROM alpine/git:latest AS builder

# Set the working directory
WORKDIR /app

# Copy the entire project context to the builder image
COPY . .

# Ensure start.sh is executable early in the builder stage
RUN chmod +x start.sh

# Create pb_data and pb_public directories
RUN mkdir -p pb_data
RUN mkdir -p pb_public

# Use a minimal Alpine image for the final stage
FROM alpine:latest

# Install curl and unzip in the final image
# These are essential for your start.sh script to work
RUN apk add --no-cache curl unzip

# Set the working directory
WORKDIR /app

# Copy the PocketBase executable, start.sh, and data/public directories
COPY --from=builder /app/pocketbase .
COPY --from=builder /app/start.sh .
COPY --from=builder /app/pb_data ./pb_data
COPY --from=builder /app/pb_public ./pb_public

# Expose the port (PocketBase default is 8090, but Render uses $PORT)
EXPOSE 8090

# Command to run your start.sh script
CMD ["./start.sh"]






















