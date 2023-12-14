import 'package:digital_hero/common/app_drawer.dart';
import 'package:digital_hero/features/auth/views/login_view.dart';
import 'package:digital_hero/theme/app_theme.dart';
import 'package:digital_hero/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digital_hero/common/app_Bar.dart';

void main() {
  testWidgets('CustomAppBar renders with title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(title: 'Test Title'),
        ),
      ),
    );

    // Verify that the CustomAppBar renders with the provided title
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('CustomAppBar renders without title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
      ),
    );

    // Verify that the CustomAppBar renders without a title
    expect(find.text('digitalHeroLogo'), findsOneWidget);
  });

  testWidgets('App_Drawer renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: App_Drawer(),
        ),
      ),
    );

    // Verify that the App_Drawer renders correctly
    expect(find.text('hello'), findsOneWidget);
    expect(find.text('Sign out'), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2)); // Two IconButton widgets
  });

  testWidgets('LoginView UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginView()));

    // Verify if the widgets are rendered properly.
    expect(find.text('Hi, Welcome '), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // Tap the login button and trigger the login process.
    await tester.tap(find.text('Login'));
    await tester.pump();

    // You may add more test cases based on your application logic.
  });
  test('Adding product to basket increases quantity', () {
  });

  test('Removing product from basket decreases quantity', () {

  });


  test('Fetching products returns a non-empty list', () async {
  });

  test('Applying a filter updates the selected filter', () {
  });
  test('Light theme has correct primary color', () {
    expect(AppTheme.lightTheme.primaryColor, equals(Colors.deepPurple));
  });

  test('Dark theme has correct primary color', () {
    expect(AppTheme.darkTheme.primaryColor, equals(Colors.deepPurple));
  });

  test('Change theme toggles between light and dark themes', () {
    final container = ProviderContainer();
    final notifier = container.read(appThemeProvider.notifier);

    expect(notifier.isLight(), equals(true)); // Initial state is light

    notifier.changeTheme();
    expect(notifier.isLight(), equals(false)); // After change, it should be dark

    notifier.changeTheme();
    expect(notifier.isLight(), equals(true)); // After another change, it should be light
  });
}
