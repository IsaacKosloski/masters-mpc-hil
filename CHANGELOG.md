# Changelog

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/);
versionamento conforme [docs/convencoes.md](docs/convencoes.md).

## [Não lançado]
### Alterado
- Deck de slides no tema `LABSEMdisciplina` do `labsem-brand` (identidade v2: grafite, marfim,
  cobre, IBM Plex), com janela de módulos na barra lateral e compilação por XeLaTeX (ADR-0006).
### Removido
- Tema derivado do AAU Sidebar (`slides/tema/`, GPL-3.0), identidade v0.1 (`docs/identidade/fonte/`)
  e `tools/identidade.*`.

## [0.1.0] - 2026-09-25
### Adicionado
- Repositório base: README, licenças, `.gitignore`, `.gitattributes`, `.editorconfig`.
- Esqueleto do monorepo (ADR-0002) e registro de decisões (ADR-0001).
- Hooks locais com pre-commit (higiene de arquivos e Conventional Commits).
- CI (checagens em PR e `main`), verificação de título de PR e release automática por tag.
