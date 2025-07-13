// This is an updated Flutter widget test for your application.

// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suitmediamob_test/screens/first_screen.dart';

void main() {
  testWidgets('User Input and Navigation Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: FirstScreen()));

    // Verify initial state of the text fields and buttons.
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Palindrome'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'CHECK'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'NEXT'), findsOneWidget);

    // Enter text into the name field.
    await tester.enterText(find.byType(TextField).first, 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), 'noon');

    // Simulate pressing the 'CHECK' button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'CHECK'));
    await tester.pump();

    // Add assertions to verify expected behavior after CHECK button is pressed, e.g., dialog or message.

    // Simulate pressing the 'NEXT' button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'NEXT'));
    await tester.pumpAndSettle(); // Wait for the navigation animation.

    // Verify that the second screen is displayed.
    expect(find.text('Welcome John Doe'), findsOneWidget);
    expect(find.text('Selected User Name'), findsOneWidget);

    // Simulate further interaction on the second screen or verify navigation.
    // Example: Selecting a user from the list on the third screen would be added here if applicable.
  });
}
