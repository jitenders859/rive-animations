import 'package:code_principles/memento/browser.dart';
import 'package:flutter/material.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final chrome = Browser();
    chrome.address = "google.com";
    chrome.address = "twitter.com";
    print(chrome.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
