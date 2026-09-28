# labsem-brand (cópia fixada)

Cópia **somente leitura** do subconjunto do [`labsem-brand`](https://github.com/labsem-ufms/labsem-brand)
necessário para compilar o deck: tema `LABSEMdisciplina`, núcleo `labsem.sty`, paleta, fontes IBM Plex,
marcas A e B (PDF), fundos, ícones e estilo de diagramas.

| Campo | Valor |
|---|---|
| Versão | `v2.2.0-rc2` |
| Origem | `labsem-brand` (ainda não publicado no GitHub) |
| Decisão | [ADR-0006](../../docs/adr/0006-tema-labsem-v2.md) |

**Não edite estes arquivos.** Mudanças no tema são feitas no `labsem-brand` e chegam aqui por atualização.

## Trocar pela versão em submódulo (quando o labsem-brand for publicado)

```powershell
git rm -r slides/labsem-brand
git commit -m "build(slides): remove a cópia fixada do labsem-brand"
git submodule add https://github.com/labsem-ufms/labsem-brand.git slides/labsem-brand
git -C slides/labsem-brand checkout v2.2.0
git commit -m "build(slides): usa o labsem-brand como submódulo"
```

Nenhum arquivo do deck muda: `latexmkrc` e `preambulo/tema.tex` já procuram `slides/labsem-brand/`.

## Licenças

Código (`.sty`): MIT. Marcas LABSEM: todos os direitos reservados, uso conforme o manual de identidade.
Fontes IBM Plex: SIL Open Font License 1.1 (`assets/fontes/OFL.txt`). Ver `LICENSE.md`.
