# docker-clamav-windows

A windows (windows/servercore) docker image that will run ClamAV (clamd) and expose port 3310.

It will run freshclam before it starts hosting clamd, so should get latest database.

The docker image is built on Windows 2019 (Build 1903).

## Usage

```
docker run -d -p 3310:3310 grofit/clamav-windows
```

## Environment Vars

**ClamVersion** - Defaults to 0.102.2
