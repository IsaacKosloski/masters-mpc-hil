# 0001 — Registrar decisões de arquitetura com ADRs

- **Status:** Aceito
- **Data:** AAAA-MM-DD

## Contexto

O repositório vai acumular escolhas de ferramentas, formatos e arquiteturas
(simulador, orquestrador, formato numérico, topologia HiL...). Sem registro,
o motivo de cada escolha se perde e decisões são revisitadas sem necessidade.

## Opções consideradas

1. Não registrar — rápido agora, caro depois.
2. Wiki/issues — fora do versionamento do código.
3. ADRs em Markdown no próprio repositório — versionados, revisados em PR.

## Decisão

Usar ADRs curtos em `docs/adr/NNNN-titulo.md`, a partir de `0000-modelo.md`.
Numeração sequencial, nunca reaproveitada. Uma decisão substituída não é
apagada: muda o status para "Substituído por NNNN".

## Consequências

Toda decisão relevante passa por um PR contendo o ADR.
