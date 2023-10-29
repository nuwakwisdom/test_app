// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:test_app/features/dashboard/presentation/widgets/dog_type_button.dart';
import 'package:test_app/features/dashboard/presentation/widgets/select_bree_button.dart';

void main() {
  testWidgets('verify select type button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.byKey(const Key('Choose Type')), findsOneWidget);
    // expect(find.byWidget(RandomImageWidget(forBreed: true)), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.

    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
