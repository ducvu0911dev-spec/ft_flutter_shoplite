import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoplite/main.dart';

void main() {
  testWidgets('placeholder follows the device light and dark theme', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    addTearDown(dispatcher.clearPlatformBrightnessTestValue);
    dispatcher.platformBrightnessTestValue = Brightness.light;

    await tester.pumpWidget(const ShopLiteApp());

    expect(find.text('ShopLite'), findsOneWidget);
    expect(find.text('Welcome to ShopLite'), findsOneWidget);
    expect(
      find.text('Your shopping experience is coming soon.'),
      findsOneWidget,
    );

    ThemeData currentTheme() => Theme.of(tester.element(find.byType(Scaffold)));

    expect(currentTheme().useMaterial3, isTrue);
    expect(currentTheme().brightness, Brightness.light);

    dispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.pumpAndSettle();

    expect(currentTheme().useMaterial3, isTrue);
    expect(currentTheme().brightness, Brightness.dark);

    dispatcher.platformBrightnessTestValue = Brightness.light;
    await tester.pumpAndSettle();

    expect(currentTheme().brightness, Brightness.light);
    expect(tester.takeException(), isNull);
  });
}
