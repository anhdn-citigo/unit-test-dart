
class OrderCalulate {
  double total = 0;

  double calculateTotal(List<double> prices) {
    double total = 0.0;
    for (var price in prices) {
      total += price;
    }
    return total;
  }

  double addPrice(double price) {
    return total += price;
  }

  double subPrice(double price) {
    return total += price;
  }



}

/// REFACTOR CODE
class OrderProcessor {
  

  void processOrder(List<double> prices) {
    double total = OrderCalulate().calculateTotal(prices);
    // Further processing logic
    print("Order processed with total: \$${total}");
  }
}