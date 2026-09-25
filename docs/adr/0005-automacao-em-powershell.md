# 0005 — Automação local em PowerShell

- **Status:** Aceito
- **Data:** AAAA-MM-DD

## Contexto

Todo o trabalho local (Quartus, ModelSim/Questa, MATLAB, LaTeX, Git) acontece no Windows,
pelo terminal PowerShell do VSCode. Scripts Bash exigiriam Git Bash/WSL e duplicariam
caminhos e aspas.

## Opções consideradas

1. Bash (Git Bash/WSL) — familiar, mas é uma segunda shell só para o repositório.
2. **PowerShell** — nativo no Windows, também roda no Linux (`pwsh`), objetos e
   tratamento de erro melhores.
3. Python como orquestrador — possível mais adiante (ADR do orquestrador), mas cada
   script simples não precisa dele.

## Decisão

- Scripts de automação em `tools/*.ps1`, com ajuda embutida (`Get-Help .\tools\x.ps1`).
- **PowerShell 7** recomendado (`winget install Microsoft.PowerShell`); os scripts são
  mantidos compatíveis com o Windows PowerShell 5.1: arquivos `.ps1` só com caracteres
  **ASCII** (o 5.1 lê UTF-8 sem BOM como ANSI).
- Todo comando externo tem o código de saída verificado (`$LASTEXITCODE`) e o script
  falha com mensagem clara.
- A CI (Linux) não depende desses scripts; quando depender, usa `pwsh`.

## Consequências

Os `tools/*.sh` da R1/R2 foram removidos. Scripts baixados em `.zip` precisam de
`Unblock-File` e a política `RemoteSigned` para o usuário atual.
