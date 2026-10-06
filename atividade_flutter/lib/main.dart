import 'package:flutter/material.dart';

void main() => runApp(const ExplorerApp());

class ExplorerApp extends StatefulWidget {
  const ExplorerApp({super.key});

  @override
  State<ExplorerApp> createState() => _ExplorerAppState();
}

// Parte (b): adaptação do Cookbook de temas, com troca durante o uso.
class _ExplorerAppState extends State<ExplorerApp> {
  bool _darkMode = false;

  void _toggleTheme() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorador de destinos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: LakePage(isDark: _darkMode, onToggleTheme: _toggleTheme),
    );
  }
}

class LakePage extends StatelessWidget {
  const LakePage(
      {super.key, required this.isDark, required this.onToggleTheme});

  final bool isDark;
  final VoidCallback onToggleTheme;

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorador de destinos'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Ativar tema claro' : 'Ativar tema escuro',
            onPressed: onToggleTheme,
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ImageSection(),
                const TitleSection(),
                ButtonSection(
                  onCall: () => _showMessage(context,
                      'Demonstração: consulte o contato no site do destino.'),
                  onRoute: () => Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (context) => const VisitPage(
                        destination: 'Lago Oeschinen',
                      ),
                    ),
                  ),
                  onShare: () => _showMessage(context,
                      'Demonstração de compartilhamento: Lago Oeschinen, Suíça.'),
                ),
                const TextSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Parte (a): imagem, título, ações e descrição organizados em uma Column.
class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        'images/lake.jpg',
        height: 240,
        fit: BoxFit.cover,
        semanticLabel: 'Lago entre montanhas nos Alpes suíços',
      );
}

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Kandersteg, Suíça', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            tooltip: _isFavorite ? 'Remover dos favoritos' : 'Favoritar',
            onPressed: () => setState(() => _isFavorite = !_isFavorite),
            icon: Icon(_isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red),
          ),
          Text('${41 + (_isFavorite ? 1 : 0)}'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: ButtonWithText(
                  icon: Icons.call, label: 'LIGAR', onPressed: onCall)),
          Expanded(
              child: ButtonWithText(
                  icon: Icons.near_me, label: 'VISITAR', onPressed: onRoute)),
          Expanded(
              child: ButtonWithText(
                  icon: Icons.share,
                  label: 'COMPARTILHAR',
                  onPressed: onShare)),
        ],
      );
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12)),
            ),
          ],
        ),
      );
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'O Lago Oeschinen fica entre as montanhas dos Alpes suíços, '
          'próximo a Kandersteg. A paisagem combina água, florestas e '
          'trilhas para explorar a natureza.\n\n'
          'Toque na estrela para favoritar o destino ou em VISITAR '
          'para abrir as informações da visita.',
          softWrap: true,
        ),
      );
}

// Parte (b): adaptação do Cookbook "Navigate to a new screen and back".
// O destino é recebido pelo construtor, em vez de uma tela genérica.
class VisitPage extends StatelessWidget {
  const VisitPage({super.key, required this.destination});

  final String destination;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Planeje sua visita')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(destination,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ideias para o passeio',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      Text(
                          '• Caminhar pelas trilhas\n• Fotografar a paisagem\n• Descansar junto ao lago'),
                      SizedBox(height: 16),
                      Text(
                          'Leve água, calçado confortável e consulte as condições locais antes de sair.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar ao destino'),
              ),
            ],
          ),
        ),
      );
}
