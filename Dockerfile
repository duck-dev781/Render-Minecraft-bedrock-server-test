
# Use a lightweight stable Linux base image
FROM ubuntu:22.04

# Avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies needed by the official Mojang bedrock server binary
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libcurl4 \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /bedrock-server

# Download the official Bedrock server binary zip (Ensure version matches what you want)
# Note: You can customize or dynamically fetch the latest URL from Mojang
RUN curl -L -o bedrock-server.zip https://azureedge.net \
    && unzip bedrock-server.zip \
    && rm bedrock-server.zip

# Configure environment execution permissions
RUN chmod +x bedrock_server

# Bedrock server default port
EXPOSE 19132/udp

# Set environment variable to locate standard libraries
ENV LD_LIBRARY_PATH=.

# Launch the server executable
CMD ["./bedrock_server"]
