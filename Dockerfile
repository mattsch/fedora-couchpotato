FROM mattsch/fedora-rpmfusion:latest
MAINTAINER Matthew Schick <matthew.schick@gmail.com>

# Install required packages
RUN dnf install -yq git \
                    procps-ng \
                    python-lxml \
                    tar \
                    unrar && \
    dnf clean all

# Set uid/gid (override with the '-e' flag), 1000/1000 used since it's the
# default first uid/gid on a fresh Fedora install
ENV LUID=1000 LGID=1000

# Create the couchpotato user/group
RUN groupadd -g $LGID couchpotato && \
    useradd -c 'CouchPotato User' -s /bin/bash -m -d /opt/couchpotato -g $LGID -u $LUID couchpotato
    
# Grab the installer, do the thing
RUN git clone -q https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato/app && \
    chown -R couchpotato:couchpotato /opt/couchpotato/app

# Need a config and storage volume, expose proper port
VOLUME /config /storage
EXPOSE 5050

# Add script to copy default config if one isn't there and start couchpotato
COPY run-couchpotato.sh /bin/run-couchpotato.sh
 
# Run our script
CMD ["/bin/run-couchpotato.sh"]


