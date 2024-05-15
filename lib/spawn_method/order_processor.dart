
/// ORIGIN CODE
// class OrderProcessor {
//   void processOrder(List<double> prices) {
//     double total = 0.0;
//     for (var price in prices) {
//       total += price;
//     }
//     // Further processing logic
//     print("Order processed with total: \$$total");
//   }
// }

/// REFACTOR CODE
class OrderProcessor {
  double calculateTotal(List<double> prices) {
    double total = 0.0;
    for (var price in prices) {
      total += price;
    }
    return total;
  }

  void processOrder(List<double> prices) {
    double total = calculateTotal(prices);
    // Further processing logic
    print("Order processed with total: \$${total}");
  }
}