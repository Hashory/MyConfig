Set-Alias codei "C:\Users\hayabusa\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"

function touch {
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string[]]$Paths
    )
    process {
        foreach ($path in $Paths) {
            if (Test-Path $path) {
                # If it exists: update the last write time to the current time
                (Get-Item $path).LastWriteTime = Get-Date
            } else {
                # If it doesn't exist: create a new file
                New-Item -Path $path -ItemType File | Out-Null
            }
        }
    }
}

# Disable npm and npx
function npm {
    Write-Host "Error: Use pnpm instead." -ForegroundColor Red
    $global:LASTEXITCODE = 1
}

function npx {
    Write-Host "Error: Use pnpm dlx instead." -ForegroundColor Red
    $global:LASTEXITCODE = 1
}
