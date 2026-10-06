# Desenvolvimento para Plataformas Móveis

Repositório das atividades da disciplina. Cada entrega tem uma pasta própria, com seus arquivos e instruções.

| Atividade | Conteúdo | Documentação |
| --- | --- | --- |
| [Catálogo responsivo — CSS Grid](atividade_grid_css/) | Website em HTML e CSS, com layout responsivo e menu mobile. | [README](atividade_grid_css/README.md) |
| [Flutter — layout e Cookbook](atividade_flutter/) | Layout do lago e adaptação do Cookbook de temas claro e escuro. | [README](atividade_flutter/README.md) · [Apresentação](atividade_flutter/docs/APRESENTACAO.md) |

## Organização

```text
.
├── README.md
├── index.html                 # Redirecionamento para o catálogo
├── atividade_grid_css/
│   ├── README.md
│   ├── index.html
│   └── style.css
└── atividade_flutter/
    ├── README.md
    ├── pubspec.yaml
    ├── pubspec.lock
    ├── lib/
    ├── images/
    ├── web/
    ├── test/
    └── docs/
```

## Executar o catálogo

Abra `atividade_grid_css/index.html` no navegador. O `index.html` da raiz redireciona para o catálogo, preservando o acesso pelo endereço inicial do site.

## Executar o Flutter

Com SDK Flutter e Chrome instalados:

```powershell
cd atividade_flutter
flutter pub get
flutter run -d chrome
```

As instruções completas, as modificações e o roteiro para apresentar ao professor estão no README de cada atividade.
