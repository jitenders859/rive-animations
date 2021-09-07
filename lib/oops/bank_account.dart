class BankAccount {
  num? _balance = 0;

  BankAccount.open() {
    _submitPapers();
    _approvalFromManager();
    _submitInDB();
  }

  void _submitPapers() {}

  void _approvalFromManager() {}

  void _submitInDB() {}

  void deposit(num amount) {
    if (amount >= 0) {
      _balance = _balance! + amount;
    } else {
      throw Exception("Amount cannot be less than 0");
    }
  }

  void withDraw(num amount) {
    if (amount <= _balance!) {
      _balance = _balance! - amount;
    } else {
      throw Exception("Amount cannot be greater than the amount available");
    }
  }

  num? getBalance() {
    return _balance;
  }
}
