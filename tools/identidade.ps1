<#
.SYNOPSIS
    Gera o manual e as pecas da identidade LABSEM em docs\identidade\build\.

.DESCRIPTION
    PDF (vetor) sempre. SVG e PNG (1200 px, fundo transparente) quando o
    pdftocairo (Poppler) estiver no PATH:  winget install oschwartz10612.Poppler

.EXAMPLE
    .\tools\identidade.ps1
#>
[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$raiz = Resolve-Path (Join-Path $PSScriptRoot "..")
$fonte = Join-Path $raiz "docs\identidade\fonte"
$saida = Join-Path $raiz "docs\identidade\build"
$sep = [IO.Path]::PathSeparator
$env:TEXINPUTS = (Join-Path $raiz "slides\tema") + "//" + $sep
New-Item -ItemType Directory -Force -Path $saida | Out-Null

function Invoke-LuaLatex {
    param([string]$Nome, [string[]]$Argumentos)
    & lualatex -interaction=nonstopmode -halt-on-error "-output-directory=$saida" @Argumentos | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Get-Content (Join-Path $saida "$Nome.log") -Tail 20
        throw "lualatex falhou: $Nome"
    }
}

Push-Location $fonte
try {
    # Manual (duas passagens: remember picture)
    Invoke-LuaLatex "manual" @("manual.tex")
    Invoke-LuaLatex "manual" @("manual.tex")

    $cairo = Get-Command pdftocairo -ErrorAction SilentlyContinue
    if (-not $cairo) {
        Write-Warning "pdftocairo nao encontrado: gerando so PDF (winget install oschwartz10612.Poppler)"
    }

    foreach ($peca in @("simbolo", "horizontal", "vertical")) {
        foreach ($var in @("cor", "negativo", "mono")) {
            $nome = "labsem-$peca-$var"
            $pre = "\def\peca{$peca}\def\variante{$var}\input{pecas}"
            Invoke-LuaLatex $nome @("-jobname=$nome", $pre)
            if ($cairo) {
                $pdf = Join-Path $saida "$nome.pdf"
                & pdftocairo -svg $pdf (Join-Path $saida "$nome.svg")
                & pdftocairo -png -transp -singlefile -scale-to 1200 $pdf (Join-Path $saida $nome)
            }
        }
    }
}
finally {
    Pop-Location
}

Get-ChildItem $saida -Include *.aux, *.log, *.out -Recurse | Remove-Item -Force
Write-Host "Identidade gerada em $saida"
