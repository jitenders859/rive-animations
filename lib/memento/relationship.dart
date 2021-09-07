import 'package:code_principles/solid/order_calc.dart';

// Inheritance
// class Pawan extends Person {}

// Composition -> has a relationship

class Service {
  ConnectionInterface connection;
  Service(this.connection);
}

// Dependency
class TaxRegion {}

class Order {
  calculate(TaxRegion taxRegion) {}
}
