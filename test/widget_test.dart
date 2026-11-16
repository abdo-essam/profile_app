import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_app/main.dart';

void main() {
  testWidgets('renders the profile without social actions', (tester) async {
    await tester.pumpWidget(const ProfileApp());
    await tester.pump();

    expect(find.text('Abdelrahman Essam'), findsOneWidget);
    expect(find.text('@abdelrahman.essam'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Mobile App Developer'), findsOneWidget);
    expect(find.text('Cairo, Egypt'), findsOneWidget);
    expect(find.text('Skills'), findsWidgets);
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Follow'), findsNothing);
    expect(find.text('Message'), findsNothing);
  });

  testWidgets('theme button switches between light and dark', (tester) async {
    await tester.pumpWidget(const ProfileApp());
    await tester.pump();

    expect(_brightnessOf(tester), Brightness.light);

    await tester.tap(find.byIcon(Icons.dark_mode_rounded));
    await tester.pumpAndSettle();

    expect(_brightnessOf(tester), Brightness.dark);
  });
}

Brightness _brightnessOf(WidgetTester tester) {
  return Theme.of(tester.element(find.text('Profile'))).brightness;
}
