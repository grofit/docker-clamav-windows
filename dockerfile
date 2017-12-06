FROM microsoft/windowsservercore
ENV ClamVersion 0.99.2

WORKDIR c:/
RUN mkdir logs
RUN mkdir db

RUN powershell -Command "wget -Uri https://www.clamav.net/downloads/production/clamav-%ClamVersion%-x64.msi -OutFile clamav.msi -UseBasicParsing"
RUN msiexec.exe /q /i clamav.msi
RUN powershell -Command Remove-Item -Path c:/clamav.msi

WORKDIR C:/Program Files/ClamAV-x64

COPY clamd.conf clamd.conf
COPY freshclam.conf freshclam.conf

RUN freshclam

EXPOSE 3310
ENTRYPOINT [ "clamd" ]