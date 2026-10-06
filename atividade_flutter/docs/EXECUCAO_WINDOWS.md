# Execução neste computador Windows

O SDK foi instalado em C:\Users\Gabri\develop\flutter.
A cópia de execução está em C:\Users\Gabri\develop\atividade_flutter_simples, fora do OneDrive e sem junção.

```powershell
$env:Path = "C:\Users\Gabri\develop\flutter\bin;$env:Path"
Set-Location C:\Users\Gabri\develop\atividade_flutter_simples
flutter pub get
flutter run -d chrome
```

Use essa pasta para desenvolver e executar. A pasta original no OneDrive é uma cópia separada: modificações futuras não são sincronizadas automaticamente entre elas.

As alternativas anteriores (contador, versão duplicada do layout e foto de Spa) foram preservadas fora da entrega em C:\Users\Gabri\develop\atividade_flutter_alternativas.

## Problemas encontrados

- `flutter` não reconhecido: o terminal não tinha o bin do SDK no PATH. O comando acima atualiza a sessão atual.
- Falha interna do analisador no caminho com acentos: a cópia de execução utiliza caminho sem acentos.
- Falha ao excluir build/flutter_assets na pasta ligada ao OneDrive: a execução foi transferida para uma pasta independente fora do OneDrive.

Após clonar em outro computador, instale o Flutter e execute os comandos gerais do README. Os caminhos locais acima não são necessários em outros computadores.
