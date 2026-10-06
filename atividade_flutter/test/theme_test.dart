import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:explorador_flutter/main.dart';

void main() {
  testWidgets('Tema alterna, preserva favorito e chega à segunda tela',
      (tester) async {
    await tester.pumpWidget(const ExplorerApp());
    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness,
        Brightness.light);
    await tester.tap(find.byTooltip('Favoritar'));
    await tester.pump();
    await tester.tap(find.byTooltip('Ativar tema escuro'));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness,
        Brightness.dark);
    expect(find.text('42'), findsOneWidget);
    await tester.tap(find.text('VISITAR'));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(Card))).brightness,
        Brightness.dark);
    await tester.tap(find.text('Voltar ao destino'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Ativar tema claro'));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness,
        Brightness.light);
    expect(find.text('42'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
