$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$env:LOCALAPPDATA = Join-Path $projectRoot ".localappdata"

quarto render $projectRoot

