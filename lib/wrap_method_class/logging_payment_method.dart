import 'payment_service.dart';

class LoggingPaymentService {
  final PaymentService _paymentService;

  LoggingPaymentService(this._paymentService);

  void processPayment(double amount, String method) {
    _paymentService.processPayment(amount, method);
    logPayment(amount, method);
  }

  void logPayment(double amount, String method) {
    print("Logged payment of \$${amount} via $method.");
  }
}

