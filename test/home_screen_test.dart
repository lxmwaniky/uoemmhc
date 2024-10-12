import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uoemmhc/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

// Mock class for HTTP client
class MockClient extends Mock implements http.Client {}

void main() {
  group('HomeScreen', () {
    // Test when the app loads with a daily quote
    testWidgets('displays daily quote on startup', (WidgetTester tester) async {
      // Create a mock HTTP client
      final client = MockClient();

      // Mock the response from the API
      when(client.get(Uri.parse('https://zenquotes.io/api/today')))
          .thenAnswer((_) async => http.Response('''[
            {"q": "Stay positive", "a": "John Doe"}
          ]''', 200));

      // Build the HomeScreen widget with the mocked client
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
          // Provide the mocked client to the widget tree
        ),
      );

      // Trigger a frame
      await tester.pumpAndSettle();

      // Verify that the quote is displayed
      expect(find.text('Stay positive'), findsOneWidget);
      expect(find.text('- John Doe'), findsOneWidget);
    });

    // Test random quote button functionality
    testWidgets('displays random quote on button press', (WidgetTester tester) async {
      final client = MockClient();

      // Mock the daily quote response
      when(client.get(Uri.parse('https://zenquotes.io/api/today')))
          .thenAnswer((_) async => http.Response('''[
            {"q": "Stay positive", "a": "John Doe"}
          ]''', 200));

      // Mock the random quote response
      when(client.get(Uri.parse('https://zenquotes.io/api/random')))
          .thenAnswer((_) async => http.Response('''[
            {"q": "Keep moving forward", "a": "Jane Doe"}
          ]''', 200));

      // Build the HomeScreen widget with the mocked client
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );

      // Wait for the daily quote to load
      await tester.pumpAndSettle();

      // Verify the initial quote is displayed
      expect(find.text('Stay positive'), findsOneWidget);

      // Tap the button to get a random quote
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the random quote is displayed
      expect(find.text('Keep moving forward'), findsOneWidget);
    });
  });
}
