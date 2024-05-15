///
/// Break out Method Object: 
/// The discount calculation logic was extracted into a new class, DiscountCalculator, 
/// which takes the necessary parameters and provides a method to calculate the discount.
///
class DiscountCalculator {
  String customerType;
  bool isHoliday;

  DiscountCalculator(this.customerType, this.isHoliday);

  double calculateDiscount() {
    double discount = 0;
    if (customerType == "VIP") {
      discount = 0.2;
    } else if (customerType == "Loyal" && isHoliday) {
      discount = 0.15;
    } else if (isHoliday) {
      discount = 0.1;
    }
    return discount;
  }
}

class TransactionProcessor {
  double processTransaction(double amount, String customerType, bool isHoliday) {
    DiscountCalculator calculator = DiscountCalculator(customerType, isHoliday);
    double discount = calculator.calculateDiscount();
    return amount - (amount * discount);
  }
}