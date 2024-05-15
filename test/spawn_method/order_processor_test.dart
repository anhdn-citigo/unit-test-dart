
import 'dart:async';

import 'package:test/test.dart';
import 'package:unit_test_demo/spawn_method/order_processor.dart';

void main() {
  group('OrderProcessor', () {
    test('calculateTotal returns correct sum', () {
      final orderProcessor = OrderProcessor();
      final prices = [10.0, 20.0, 30.0];
      final total = orderProcessor.calculateTotal(prices);

      expect(total, 60.0);
    });

    test('calculateTotal returns 0 for empty list', () {
      final orderProcessor = OrderProcessor();
      final prices = <double>[];
      final total = orderProcessor.calculateTotal(prices);

      expect(total, 0.0);
    });

    test('processOrder prints correct total', () {
      final orderProcessor = OrderProcessor();
      final prices = [10.0, 20.0, 30.0];

      // Capture print output
      final printLog = <String>[];
      final spec = ZoneSpecification(print: (_, __, ___, String msg) {
        printLog.add(msg);
      });

      // Run the test in a custom zone
      Zone.current.fork(specification: spec).run(() {
        orderProcessor.processOrder(prices);
      });

      expect(printLog, ['Order processed with total: \$60.0']);
    });
  });
}