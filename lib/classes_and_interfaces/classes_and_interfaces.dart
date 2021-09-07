import 'package:code_principles/classes_and_interfaces/tax_calculator.dart';
import 'package:code_principles/oops/bank_account.dart';
import 'package:flutter/material.dart';

class BuildingWidget extends StatefulWidget {
  const BuildingWidget({Key? key}) : super(key: key);

  @override
  _BuildingWidgetState createState() => _BuildingWidgetState();
}

class _BuildingWidgetState extends State<BuildingWidget> {
  @override
  void initState() {
    super.initState();
    var srs = Building();
    srs.name = "SRS CORP";
    srs.noOfFlats = 50;
    srs.sendNotice();

    var rps = Building();
    rps.name = "RPS CORP";
    rps.noOfFlats = 100;
    rps.sendNotice();

    var pkAccount = BankAccount.open();

    pkAccount.getBalance();

    TextCalculator2021 calculator2021 = TextCalculator2021();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Building {
  String? name;
  int? noOfFlats;
  int? totalFlats;
  List<Flat>? flats;

  sendNotice() {
    print('notice sent!');
  }
}

class Flat {
  int? flatNumber;
  int? flatType;
}
