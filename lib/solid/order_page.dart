import 'package:code_principles/solid/order_calc.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    final customerInfo = CustomerInfo();
    customerInfo.shipping = 5;
    customerInfo.textPercentage = 0.4;
    customerInfo.tip = 10;
    customerInfo.totalAmount = 100;
    customerInfo.calculateOrder();
    print(customerInfo.balance);
    EmailOrder.sendEmail();

    final Service service = Service();
    service.connection = FirebaseDBConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
