import 'dart:async';

import 'package:test/test.dart';
import 'package:unit_test_demo/wrap_method_class/logging_payment_method.dart';
import 'package:unit_test_demo/wrap_method_class/payment_service.dart';

void main() {
  group('LoggingPaymentService', () {
    test('processPayment should process and log the payment', () {
      // Create a mock PaymentService
      final mockPaymentService = PaymentService();
      final logger = LoggingPaymentService(mockPaymentService);

      // Capture print statements to verify output
      var log = <String>[];
      runZoned(() {
        logger.processPayment(100.0, "credit");
      }, zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, line) => log.add(line)
      ));

      // Verify that both the payment and logging were triggered
      expect(log, contains("Processing payment of \$100.0 via credit."));
      expect(log, contains("Logged payment of \$100.0 via credit."));
    });
  });
}
