# escape=`

FROM microsoft/mssql-server-windows-developer:1709

ENV SA_PASSWORD=Pass@word
ENV ACCEPT_EULA=Y

COPY ./SqlCmdScript.sql .
RUN sqlcmd -i SqlCmdScript.sql