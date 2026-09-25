<#
.SYNOPSIS
    Compila as notas de aula (slides/).

.EXAMPLE
    .\tools\slides.ps1              # deck completo    -> slides\build\main.pdf
    .\tools\slides.ps1 r01-git      # modulo isolado   -> slides\build\r01-git.pdf
    .\tools\slides.ps1 vivo         # recompila a cada salvamento
    .\tools\slides.ps1 limpar       # apaga slides\build
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Alvo = ""
)

$ErrorActionPreference = "Stop"
$slides = Join-Path $PSScriptRoot "..\slides"

function Invoke-Latexmk {
    param([string[]]$Argumentos)
    & latexmk @Argumentos
    if ($LASTEXITCODE -ne 0) {
        throw "latexmk falhou (codigo $LASTEXITCODE). Veja slides\build\*.log"
    }
}

Push-Location $slides
try {
    switch ($Alvo) {
        "" {
            Invoke-Latexmk @("main.tex")
        }
        "vivo" {
            Invoke-Latexmk @("-pvc", "main.tex")
        }
        "limpar" {
            if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
        }
        default {
            if (-not (Test-Path (Join-Path "modulos" "$Alvo.tex"))) {
                throw "modulos\$Alvo.tex nao existe"
            }
            Invoke-Latexmk @("-jobname=$Alvo", "-usepretex=\def\arquivo{$Alvo}", "avulso.tex")
        }
    }
}
finally {
    Pop-Location
}
