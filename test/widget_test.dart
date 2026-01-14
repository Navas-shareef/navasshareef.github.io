import 'package:flutter_test/flutter_test.dart';

import 'package:shabio/main.dart';

void main() {
  testWidgets('Portfolio app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the app title is present
    expect(find.text('Flutter Developer'), findsOneWidget);

    // Verify that main sections are present
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
  });
}
