# escape=`

FROM mcr.microsoft.com/windows/servercore:1809 AS installer
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV UMBRACO_VERSION="8.3.0" `
    UMBRACO_DOWNLOAD_ID="279395"

RUN Invoke-WebRequest -UseBasicParsing -OutFile umbraco.zip -Uri "https://our.umbraco.org/ReleaseDownload?id=$($env:UMBRACO_DOWNLOAD_ID)"; `
    Expand-Archive umbraco.zip -DestinationPath C:\umbraco

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV UMBRACO_VERSION="8.3.0" `
    UMBRACO_ROOT="C:\inetpub\wwwroot\Umbraco"

RUN Remove-Website 'Default Web Site'; `
    New-Item -Path $env:UMBRACO_ROOT -Type Directory -Force; `
    New-Website -Name 'umbraco' -PhysicalPath $env:UMBRACO_ROOT -Port 80 -Force; 

HEALTHCHECK --interval=5s `
 CMD powershell -command `
    try { `
        $response = iwr http://localhost/ -UseBasicParsing; `
        if ($response.StatusCode -eq 200) { return 0} `
        else {return 1}; `
    } catch { return 1 }

COPY --from=installer C:\umbraco ${UMBRACO_ROOT}
COPY Set-UmbracoAcl.ps1 C:\
RUN C:\Set-UmbracoAcl.ps1