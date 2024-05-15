///
/// The TransactionProcessor class initially contained complex logic 
/// for calculating discounts based on customer type and holiday status.
///
class TransactionProcessor {
  double processTransaction(double amount, String customerType, bool isHoliday) {
    double discount = 0;
    if (customerType == "VIP") {
      discount = 0.2;
    } else if (customerType == "Loyal" && isHoliday) {
      discount = 0.15;
    } else if (isHoliday) {
      discount = 0.1;
    }
    return amount - (amount * discount);
  }
}
