class PaymentDetails {
  final String accountNumber;
  final double amount;
  final String currency;

  PaymentDetails(this.accountNumber, this.amount, this.currency);

  // Factory method to create PaymentDetails with default values
  static PaymentDetails createDefault() {
    return PaymentDetails("1234567890", 100.0, "USD");
  }
}

class PaymentService {
  void processPayment(PaymentDetails details) {
    // Complex logic to process payment
    print("Processing payment of ${details.amount} ${details.currency} for account ${details.accountNumber}");
  }
}