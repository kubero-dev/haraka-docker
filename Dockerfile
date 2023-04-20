ARG BUILDPLATFORM=linux/amd64
FROM --platform=$BUILDPLATFORM node:lts-alpine 

# Install dependencies
RUN apk add --no-cache \
    ca-certificates \
    openssl \
    python3 \
    make \
    g++

# Install Haraka
RUN npm install -g Haraka && haraka -i /haraka

# Copy configuration files
COPY --chmod=755 init-haraka.sh /usr/local/bin/init-haraka.sh

# Copy configuration files
#COPY --chmod=755 config /haraka/config

CMD [ "init-haraka.sh" ]