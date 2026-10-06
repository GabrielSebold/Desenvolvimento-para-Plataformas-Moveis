# Apresentação em sala

## 1. Explicar a parte (a)

“Implementei o layout do lago proposto na documentação Flutter. Organizei a imagem, o título, os botões e a descrição em uma Column. Usei Row para colocar elementos lado a lado, Expanded para distribuir espaço e Padding para os espaçamentos.”

Mostre a tela inicial e identifique essas quatro seções.

## 2. Explicar a parte (b)

“Escolhi o Cookbook de temas do Flutter. Modifiquei o exemplo para ter tema claro e escuro e acrescentei um botão de lua e sol para alternar entre eles durante o uso.”

Clique na lua, mostre a mudança de cores e clique no sol para retornar.

## 3. Mostrar o código

Abra lib/main.dart e identifique:

| Trecho | Explicação |
| --- | --- |
| `ExplorerApp extends StatefulWidget` | O aplicativo guarda uma informação que pode mudar: o tema escolhido. |
| `bool _darkMode = false` | Começa no modo claro; true seleciona o escuro. |
| `_toggleTheme` | Inverte a escolha ao tocar no botão. |
| `setState` | Avisa ao Flutter que o estado mudou e a interface precisa ser reconstruída. |
| `theme` | Define o tema claro. |
| `darkTheme` e `Brightness.dark` | Definem o tema escuro. |
| `themeMode` | Seleciona qual tema aplicar. |
| `IconButton` na `AppBar` | Chama a troca do tema e alterna o ícone entre lua e sol. |

## 4. Responder perguntas

**Qual Cookbook foi escolhido?** Use themes to share colors and font styles.

**Qual foi a alteração principal?** Criar dois temas e permitir alternância com um botão, aplicada ao layout do lago.

**Instalou uma biblioteca?** Não. A adaptação usa recursos do próprio SDK Flutter. O enunciado pede modificar um exemplo do Cookbook ou Samples.

**A escolha fica salva ao fechar?** Não. O estado é local e reinicia no tema claro.

**Quais outros recursos existem?** Favorito interativo e uma tela de visita com navegação. São complementos; o exemplo escolhido para a parte (b) é o de temas.

**O que os botões fazem?** VISITAR abre outra tela. LIGAR e COMPARTILHAR mostram mensagens de demonstração.

Estude o código e pratique a demonstração antes da apresentação para explicar o funcionamento com suas próprias palavras.
