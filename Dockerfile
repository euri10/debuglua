FROM openresty/openresty:1.21.4.1-0-bullseye-fat

RUN DEBIAN_FRONTEND=noninteractive && \
        apt-get update && \
        apt-get install -y unzip && \
        apt-get -y clean && \
        rm -rf /var/lib/apt/lists/*

# lua debugging
# Download and unzip the EmmyLuaDebugger release
ADD https://github.com/EmmyLua/EmmyLuaDebugger/releases/download/1.7.1/linux-x64.zip /usr/local/emmy/linux-x64.zip
RUN cd /usr/local/emmy && \
    unzip linux-x64.zip && \
    rm linux-x64.zip


COPY rootfs /
