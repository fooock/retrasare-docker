FROM debian:stretch

# Install dependencies
RUN apt-get update && apt-get install -y \
    libglib2.0-dev \
    libupnp-dev \
    libssl-dev \
    libxss-dev \
    libgnome-keyring-dev \
    libbz2-dev \
    libsqlcipher-dev \
    libspeex-dev \
    libspeexdsp-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    libopencv-dev \
    tcl8.6 \
    libmicrohttpd-dev \
    rapidjson-dev \
    qttools5-dev \
    qt5-default \
    qtmultimedia5-dev \
    libqt5x11extras5-dev \
    git

# Create default user
RUN useradd -m retroshare
WORKDIR /home/retroshare

# Download, compile and install
RUN git clone https://github.com/RetroShare/RetroShare.git
RUN cd RetroShare && qmake && make && make install
RUN cd .. && rm -rf RetroShare

# Start retroshare with nogui option
ENTRYPOINT [ "/usr/bin/retroshare-nogui", "--webinterface", "9090", "--docroot", "/usr/share/retroshare/webui/", "--http-allow-all" ]
