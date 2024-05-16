import 'dart:async';

import 'package:test/test.dart';
import 'package:unit_test_demo/irritating_class/payment_detail_refactor.dart';

void main() {
  group('PaymentService', () {
    test('processPayment processes payment with default details', () {
      final paymentService = PaymentService();
      final paymentDetails = PaymentDetails.createDefault();

      // Capture print statements to verify output
      var log = <String>[];
      runZoned(() {
        paymentService.processPayment(paymentDetails);
      }, zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, line) => log.add(line)
      ));

      // Verify that the payment was processed with the default details
      expect(log, contains("Processing payment of 100.0 USD for account 1234567890"));
    });
  });
}