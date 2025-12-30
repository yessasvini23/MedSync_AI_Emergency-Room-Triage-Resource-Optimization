# Download and Install Python with PATH support
$pythonUrl = "https://www.python.org/ftp/python/3.13.1/python-3.13.1-amd64.exe"
$installerPath = "C:\Users\hp\Downloads\python-installer.exe"

Write-Host "Downloading Python 3.13.1..." -ForegroundColor Green
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $pythonUrl -OutFile $installerPath -UseBasicParsing

Write-Host "Python installer downloaded to: $installerPath" -ForegroundColor Green
Write-Host "Installing Python with PATH support..." -ForegroundColor Green

# Install with PrependPath (adds to PATH)
& "$installerPath" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

Write-Host "Waiting for installation to complete..." -ForegroundColor Yellow
Start-Sleep -Seconds 45

Write-Host "Installation complete! Verifying..." -ForegroundColor Green
python --version

Write-Host "Cleaning up installer..." -ForegroundColor Yellow
Remove-Item $installerPath -Force

Write-Host "Python installation complete!" -ForegroundColor Green
