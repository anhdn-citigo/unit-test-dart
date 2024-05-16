class PaymentDetails {
  final String accountNumber;
  final double amount;
  final String currency;

  PaymentDetails(this.accountNumber, this.amount, this.currency);
}

class PaymentService {
  
  void processPayment(PaymentDetails details) {
    // Complex logic to process payment
    print("Processing payment of ${details.amount} ${details.currency} for account ${details.accountNumber}");
  }

}