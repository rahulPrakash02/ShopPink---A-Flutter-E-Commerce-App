class Wallet {
  double balance = 5000.0;

  void withdraw(double amount) {
    balance -= amount;
  }
}
