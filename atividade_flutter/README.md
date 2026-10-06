# Atividade Flutter — layout e Cookbook modificado

Implementação do layout do lago da documentação Flutter e adaptação do Cookbook de temas, com alternância entre modo claro e escuro.

## a) Ler e implementar o layout proposto

Referência: [Build a Flutter layout](https://docs.flutter.dev/ui/layout/tutorial).

O aplicativo reproduz a organização visual proposta: imagem do lago, título e localização, estrela com contador, três ações e descrição. Os textos foram adaptados para português e o tema utiliza verde.

| Widget | Função no layout |
| --- | --- |
| `Column` | Empilha imagem, título, ações e descrição. |
| `Row` | Organiza título, estrela e ações horizontalmente. |
| `Expanded` | Distribui o espaço disponível. |
| `Padding` | Define espaçamento ao redor dos elementos. |
| `SingleChildScrollView` | Permite rolagem em telas pequenas. |
| `Image.asset` | Carrega a foto local declarada no `pubspec.yaml`. |

## b) Criar um Cookbook/Sample e realizar modificações

**Exemplo escolhido:** [Use themes to share colors and font styles](https://docs.flutter.dev/cookbook/design/themes), do Flutter Cookbook.

Foi criada uma adaptação da receita no mesmo aplicativo da parte (a). Não foi clonado o repositório completo de samples. A receita ensina a definir `ThemeData` e `ColorScheme` no `MaterialApp`; esta implementação usa fontes padrão do Flutter e acrescenta alternância interativa de temas.

| Base da receita | Modificação realizada |
| --- | --- |
| Configuração de um tema no `MaterialApp` | Dois temas: `theme` claro e `darkTheme` escuro. |
| Cores definidas por `ColorScheme` | Paleta baseada em verde nos dois modos. |
| Aparência configurada no código | Botão de lua/sol permite mudar durante o uso. |
| Demonstração de temas | Aplicação ao layout do lago e à tela de visita. |

A variável `_darkMode` guarda a escolha. `_toggleTheme` inverte seu valor dentro de `setState`. A propriedade `themeMode` determina qual tema o Flutter aplica. Não há dependência externa de execução além do SDK Flutter.

**Recursos adicionais:** favorito interativo e tela de visita baseada no [Cookbook de navegação](https://docs.flutter.dev/cookbook/navigation/navigation-basics). LIGAR e COMPARTILHAR exibem mensagens de demonstração.

## Executar e verificar

Requisitos: SDK Flutter estável compatível e Chrome. No terminal, dentro da pasta do projeto:

```powershell
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

Para gerar a versão web:

```powershell
flutter build web
```

Se o app estiver aberto em `flutter run`, pressione `R` maiúsculo para reiniciar com as alterações. Este projeto inclui a plataforma web; não inclui a estrutura Android ou iOS.

Neste computador, use a cópia fora do OneDrive, seguindo [as instruções locais](docs/EXECUCAO_WINDOWS.md).

## Estudo do código e apresentação em sala

O código do aplicativo está em [`lib/main.dart`](lib/main.dart). O [roteiro de apresentação](docs/APRESENTACAO.md) explica os pontos para demonstrar e as classes para estudar.

A entrega contém a implementação das partes (a) e (b); a demonstração e a explicação ao professor devem ser realizadas pelo aluno em sala, conforme o enunciado.

## Testes e limites

Verificado com Flutter 3.47.6 e Dart 3.13.5: análise sem problemas, três testes aprovados e compilação web concluída. Não foi realizada inspeção visual no navegador.

Os testes verificam favorito e navegação, rolagem em tela pequena, alternância de temas, manutenção do favorito ao mudar o tema e aplicação do tema na tela de visita. Tema e favorito ficam apenas na memória: reiniciar o app restaura o modo claro e o contador demonstrativo inicial de 41.

LIGAR e COMPARTILHAR não executam ações no sistema. VISITAR abre informações e não um mapa ou uma reserva.

## Créditos

- Layout: [documentação Flutter](https://docs.flutter.dev/ui/layout/tutorial).
- Cookbook principal: [temas](https://docs.flutter.dev/cookbook/design/themes).
- Cookbook adicional: [navegação](https://docs.flutter.dev/cookbook/navigation/navigation-basics).
- Foto do lago: Dino Reichmuth / Unsplash, conforme os créditos do tutorial; obtida do [asset oficial do exemplo](https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg), sob a [licença Unsplash](https://unsplash.com/license).
- A documentação Flutter declara licença CC BY 4.0 para seus textos e BSD de três cláusulas para exemplos de código. Este README descreve a implementação em palavras próprias.
