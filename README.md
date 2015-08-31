# Fedora CouchPotato Docker Container

Docker container for [CouchPotato](https://couchpota.to/) using Fedora.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -p 5050:5050 --name=couchpotato mattsch/fedora-couchpotato
```

Create with a custom uid/gid for the couchpotato daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 5050:5050 --name=couchpotato mattsch/fedora-couchpotato
```

