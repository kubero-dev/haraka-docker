ARG BUILDPLATFORM=linux/amd64
FROM --platform=$BUILDPLATFORM node:lts-alpine 

# Install dependencies
RUN apk add --no-cache \
    ca-certificates \
    openssl \
    python3 \
    py3-pip \
    make \
    g++

# Install Haraka
RUN npm install -g Haraka && haraka -i /haraka

# Copy configuration files
COPY --chmod=755 init /usr/local/bin

# Copy configuration files
#COPY --chmod=755 config /haraka/config

# install reqired python modules
RUN pip3 install jinja2 argparse

COPY --chmod=444 templates /haraka/templates
COPY --chmod=755 haraka-configure.py /usr/local/bin/haraka-configure
COPY --chmod=755 start-haraka.sh /usr/local/bin

CMD [ "start-haraka.sh" ]