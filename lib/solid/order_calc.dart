class OrderCalculator {
  num? totalAmount;
  num? textPercentage;
  num? tip;
  num? shipping;

  void calculateOrder() {
    final orderValue = totalAmount! + textPercentage! + tip! + shipping!;
  }
}

class CustomerInfo extends OrderCalculator {
  num balance = 50;
}

class EmailOrder {
  static final email = 'mtechviral@gamil.com';

  static void sendEmail() {
    print("Sending email to $email with amount");
  }
}

abstract class Shape {
  void area() {}
}

class Circle implements Shape {
  num? radius;

  @override
  void area() {
    print("Pi r2");
  }
}

class Square implements Shape {
  num? length;

  @override
  void area() {
    print("length * length");
  }
}

class Rectangle implements Shape {
  double? width;
  double? height;

  @override
  void area() {
    print('length * height');
  }
}

abstract class Shape2 {
  num? width;
  num? height;
}

class SquareShape implements Shape2 {
  num? _width;
  num? _height;

  get width => width;
  get height => _height;

  set height(value) => _height = value;
  set width(value) => _width = value;

  void setWidth(num value) {
    this._width = value;
    this._height = value;
  }
}

class AreaCalculator {
  calculate() {}
}

abstract class Mammal {
  void see();
  void eat();
}

abstract class FlyInterface {
  void fly();
}

class Bird implements Mammal, FlyInterface {
  @override
  void eat() {
    // TODO: implement eat
  }

  @override
  void see() {
    // TODO: implement see
  }

  @override
  void fly() {
    // TODO: implement fly
  }
}

class Service {
  ConnectionInterface? connection;

  void connect() {
    connection!.connect();
  }
}

abstract class ConnectionInterface {
  void connect();
}

class MyDBConnection implements ConnectionInterface {
  @override
  void connect() {}
}

class FirebaseDBConnection implements ConnectionInterface {
  @override
  void connect() {
    // TODO: implement connect
  }
}
