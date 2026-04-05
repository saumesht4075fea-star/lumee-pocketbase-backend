# Stage 1: Builder
# Use alpine/git to get git and other tools needed for building (if any in the future)
FROM alpine/git:latest as builder

# Set the working directory in the builder stage
WORKDIR /app

# Copy all local files into the container's /app directory
COPY . .

# Create the pb_data and pb_public directories if they don't exist.
# This ensures they are present to be copied to the final image, preventing 'not found' errors.
RUN mkdir -p pb_data
RUN mkdir -p pb_public

# Make the PocketBase executable and start.sh script executable
RUN chmod +x pocketbase
RUN chmod +x start.sh

# Stage 2: Final Image
# Use a lean Alpine Linux base image for the final deployment
FROM alpine:latest

# Set the working directory in the final image
WORKDIR /app

# Copy only the necessary files from the builder stage
# (PocketBase executable, start.sh, and the data/public directories)
COPY --from=builder /app/pocketbase .
COPY --from=builder /app/start.sh .
COPY --from=builder /app/pb_data ./pb_data
COPY --from=builder /app/pb_public ./pb_public

# Expose the port PocketBase will run on (Render automatically injects the PORT env var)
EXPOSE $PORT

# Define the command to run when the container starts
CMD ["/bin/sh", "./start.sh"]
