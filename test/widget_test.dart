import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizmatch/main.dart';

void main() {
  for (final size in [const Size(800, 600), const Size(390, 844)]) {
    for (final button in ['Facebook', 'Google', 'LinkedIn']) {
      testWidgets('$button demo opens and returns at $size', (tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(MyApp());
        await tester.tap(find.text('Pievienoties ar $button'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
        expect(find.text('Pievienoties ar $button'), findsOneWidget);
      });
    }
  }
}
