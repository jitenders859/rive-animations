class BrowserHistory {
  List<String> _urls = [];

  push(String url) {
    _urls.add(url);
  }

  String pop() {
    return _urls.removeLast();
  }
}
