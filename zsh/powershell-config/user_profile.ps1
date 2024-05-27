# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# https://technet.microsoft.com/en-us/magazine/hh241048.aspx
$MaximumHistoryCount = 10000;

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\softDev.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias trash Remove-ItemSafely
set-alias unzip expand-archive
Set-Alias ls lsd
Set-Alias g git
Set-Alias df get-volume
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function pkill($name) {
	get-process $name -ErrorAction SilentlyContinue | stop-process
}

function pgrep($name) {
	get-process $name
}

function reboot {
	shutdown /r /t 0
}

function .. { Set-Location -Path .. }

function ... { Set-Location -Path ..\.. }

function .... { Set-Location -Path ..\..\.. }

function ll { lsd -lh --group-dirs=first }
function la { lsd -a --group-dirs=first }

function open { Invoke-Item $args }

function l { lsd --group-dirs=first }

function lla { lsd -lha --group-dirs=first }

function up { winget upgrade --all --include-unknown }

function catj { bat -l java $args }

function lazyg {
    git add .
    git commit -m "$args"
    git push
}

function gcom {
    git add .
    git commit -m "$args"
}

function ifconfig {
    Get-NetIPAddress | Format-Table -AutoSize
}

function md5 { Get-FileHash -Algorithm MD5 $args }

function sha1 { Get-FileHash -Algorithm SHA1 $args }

function sha256 { Get-FileHash -Algorithm SHA256 $args }

function n { notepad $args }

# Drive shortcuts
function HKLM: { Set-Location HKLM: }
function HKCU: { Set-Location HKCU: }
function Env: { Set-Location Env: }


# alias bookmarks

function GoogleDir { Set-Location C:\Users\softDev\Downloads\Google }

Set-Alias google-d GoogleDir

function workspace {
    Set-Location C:\Users\softDev\WorkSpaces   
}

Set-Alias wp workspace

function GitDir { Set-Location C:\Users\softDev\Downloads\git-downloads }

Set-Alias git-d GitDir

# fzf-preview
function fzfLovely {
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
}

Set-Alias ff  fzfLovely


# gitCommit

function GitCommit([string]$message) { git commit -m "$message" }

Set-Alias gcms GitCommit

# gitPush

function GitPush([string]$remote, [string]$branch) { git push $remote $branch }

# example: gitPush origin main/master

Set-Alias gpsh GitPush

function GitPushOriginMain { git push origin main }

Set-Alias gpmain GitPushOriginMain

# gitStatus

function GitStatus { git status }

Set-Alias gt GitStatus

# gitAdd

function GitAdd([string]$file) { git add "$file" }

Set-Alias ga GitAdd

# Touch
# example: touch C:\Users\softDev\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
function touch($file) {
	if ( Test-Path $file ) {
		Set-FileTime $file
	} else {
		New-Item $file -type file
	}
}

# From https://stackoverflow.com/questions/894430/creating-hard-and-soft-links-using-powershell
function ln($target, $link) {
	New-Item -ItemType SymbolicLink -Path $link -Value $target
}

set-alias new-link ln

Function WhoIs {
    param (
                    [Parameter(Mandatory=$True,
                               HelpMessage='Please enter domain name (e.g. microsoft.com)')]
                               [string]$domain
            )
    Write-Host "Connecting to Web Services URL..." -ForegroundColor Green
    try {
    #Retrieve the data from web service WSDL
    If ($whois = New-WebServiceProxy -uri "http://www.webservicex.net/whois.asmx?WSDL") {Write-Host "Ok" -ForegroundColor Green}
    else {Write-Host "Error" -ForegroundColor Red}
    Write-Host "Gathering $domain data..." -ForegroundColor Green
    #Return the data
    (($whois.getwhois("=$domain")).Split("<<<")[0])
    } catch {
    Write-Host "Please enter valid domain name (e.g. microsoft.com)." -ForegroundColor Red}
    } #end function WhoIs
