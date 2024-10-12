import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uoemmhc/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen shows correct text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Check if the title is displayed
    expect(find.text('University of Embu Mental Health Club'), findsOneWidget);
    expect(find.text('End the Stigma and Be the Change.'), findsOneWidget);
  });

  testWidgets('Navigates to HomeScreen when button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Tap the button to navigate to HomeScreen
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify that we are now on the HomeScreen
    expect(find.text('Mental Health Club(UOEM)'), findsOneWidget);
  });
}
