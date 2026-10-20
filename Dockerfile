
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

CMD ["sh", "-c", "echo 'Container is ready for the Minecraft Bedrock server test.' && sleep infinity"]
