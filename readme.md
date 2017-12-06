# docker-clamav-windows

A windows (windowsservercore) docker image that will run ClamAV (clamd) and expose port 3310.

It will run freshclam before it starts hosting clamd, so should get latest database.

## Usage

```
docker run -d -p 3310:3310 grofit/clamav-windows
```
    
## Environment Vars

**ClamVersion** - Defaults to 0.99.2