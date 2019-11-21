# Out-Null
# This script installs IIS and the features required to
# run West Wind Web Connection.
#
# https://weblog.west-wind.com/posts/2017/may/25/automating-iis-feature-installation-with-powershell
#
# * Make sure you run this script from a Powershel Admin Prompt!
# * Make sure Powershell Execution Policy is bypassed to run these scripts:
# * YOU MAY HAVE TO RUN THIS COMMAND PRIOR TO RUNNING THIS SCRIPT!
# Set-ExecutionPolicy Bypass -Scope Process

# To list all Windows Features: dism /online /Get-Features
# Get-WindowsOptionalFeature -Online 
# LIST All IIS FEATURES: 
# Get-WindowsOptionalFeature -Online | where FeatureName -like 'IIS-*'

# LIST ENABLED IIS FEATURES:
# Get-WindowsOptionalFeature -Online | where {$_.state -eq "Enabled"} | where FeatureName -ilike 'IIS-*' | ft -Property featurename

Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-HttpRedirect
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ApplicationDevelopment

#Enable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-NetFxExtensibility45

# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-HttpLogging
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-Security
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-RequestFiltering
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-HttpCompressionDynamic
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-WebServerManagementTools
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HostableWebCore 
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-BasicAuthentication
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-StaticContent
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-DefaultDocument
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing 
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ISAPIFilter
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-HttpCompressionStatic
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes   

Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ASPNET45

# If you need classic ASP (not recommended)
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-ASP
Enable-WindowsOptionalFeature -norestart -Online -FeatureName IIS-CGI

# Install UrlRewrite Module for Extensionless Urls (optional)
###  & "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" /install /Products:UrlRewrite2 /AcceptEULA /SuppressPostFinish
#choco install urlrewrite -y
    
# Install WebDeploy for Deploying to IIS (optional)
### & "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" /install /Products:WDeployNoSMO /AcceptEULA /SuppressPostFinish
# choco install webdeploy -y

# Disable Loopback Check on a Server - to get around no local Logins on Windows Server
# New-ItemProperty HKLM:\System\CurrentControlSet\Control\Lsa -Name "DisableLoopbackCheck" -Value "1" -PropertyType dword