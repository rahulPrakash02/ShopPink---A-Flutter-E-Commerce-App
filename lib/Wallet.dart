//Dart Class for the wallet
class Wallet {
  
  //public object for balance
  double balance = 5000.0;

  //function for withdrawing amount
  void withdraw(double amount) {
    balance -= amount;
  }
}
