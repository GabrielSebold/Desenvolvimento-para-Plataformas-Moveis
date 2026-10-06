import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:explorador_flutter/main.dart';

void main() {
  testWidgets('Favorito alterna e é preservado ao voltar da visita',
      (tester) async {
    await tester.pumpWidget(const ExplorerApp());
    expect(find.text('41'), findsOneWidget);
    await tester.tap(find.byTooltip('Favoritar'));
    await tester.pump();
    expect(find.text('42'), findsOneWidget);

    await tester.tap(find.text('VISITAR'));
    await tester.pumpAndSettle();
    expect(find.text('Planeje sua visita'), findsOneWidget);
    expect(find.text('Lago Oeschinen'), findsOneWidget);
    await tester.tap(find.text('Voltar ao destino'));
    await tester.pumpAndSettle();
    expect(find.text('42'), findsOneWidget);

    await tester.tap(find.byTooltip('Remover dos favoritos'));
    await tester.pump();
    expect(find.text('41'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Layout permite rolagem em tela pequena', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ExplorerApp());
    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
