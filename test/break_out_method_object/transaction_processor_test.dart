import 'package:test/test.dart';
import 'package:unit_test_demo/break_out_method_object/transaction_processor_t.dart';

void main() {
  group('DiscountCalculator', () {
    test('calculates correct discount for VIP customers', () {
      var calculator = DiscountCalculator("VIP", false);
      expect(calculator.calculateDiscount(), 0.2);
    });

    test('calculates correct discount for Loyal customers on holidays', () {
      var calculator = DiscountCalculator("Loyal", true);
      expect(calculator.calculateDiscount(), 0.15);
    });

    test('calculates correct discount during holidays for regular customers', () {
      var calculator = DiscountCalculator("Regular", true);
      expect(calculator.calculateDiscount(), 0.1);
    });

    test('calculates no discount for regular customers on non-holidays', () {
      var calculator = DiscountCalculator("Regular", false);
      expect(calculator.calculateDiscount(), 0.0);
    });
  });
}