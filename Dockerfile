FROM mcr.microsoft.com/windows/servercore:1903
ENV ClamVersion 0.102.2
ENV ClamAVDestinationPath C:/Program Files/ClamAV-x64

WORKDIR c:/
RUN mkdir logs
RUN mkdir db

RUN powershell -Command "wget -Uri https://www.clamav.net/downloads/production/clamav-%ClamVersion%-win-x64-portable.zip -OutFile clamav-win-x64-portable.zip -UseBasicParsing"
RUN powershell -Command Expand-Archive -Path c:/clamav-win-x64-portable.zip -DestinationPath 'C:/Program Files/ClamAV-x64'
RUN powershell -Command Remove-Item -Path c:/clamav-win-x64-portable.zip

WORKDIR C:/Program Files/ClamAV-x64

COPY clamd.conf clamd.conf
COPY freshclam.conf freshclam.conf

RUN freshclam

EXPOSE 3310
ENTRYPOINT [ "clamd" ]
