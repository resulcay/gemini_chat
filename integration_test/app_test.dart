import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_chat/keys.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gemini_chat/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Navigate to Chat Screen',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final Finder button = find.byKey(TestKeys.navigateToChatButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsOneWidget);

      await tester.pumpAndSettle();
      final Finder textField = find.byType(TextField);
      final Finder sendButton = find.byIcon(Icons.send);
      await tester.enterText(textField, 'Hello');
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);
    },
  );
}
