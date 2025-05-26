import 'package:flutter_test/flutter_test.dart';

import 'package:college_erp_app/main.dart';

void main() {
  testWidgets('App loads login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CollegeERPApp());

    // Verify that the login screen loads.
    expect(find.text('Login'), findsOneWidget);
  });
}