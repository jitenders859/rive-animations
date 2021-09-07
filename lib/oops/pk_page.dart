import 'package:code_principles/oops/pk_widget.dart';
import 'package:flutter/material.dart';

class PKPage extends StatefulWidget {
  const PKPage({Key? key}) : super(key: key);

  @override
  _PKPageState createState() => _PKPageState();
}

class _PKPageState extends State<PKPage> {
  renderComponent(PKWidget box) {
    box.render();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var textBox = PKTextBox();
    renderComponent(PKTextBox());
    renderComponent(PKButton());
    textBox.text = "Pawan";
    textBox.enable();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
