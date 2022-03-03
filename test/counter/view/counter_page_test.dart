import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:najot/ui/pages/counter_page/counter_page.dart';
import 'package:najot/ui/pages/counter_page/counter_view.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
