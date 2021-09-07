class Browser {
  String? address;

  createState() {
    return BrowserState(address!);
  }

  restoreState(BrowserState state) {
    address = state.content;
  }

  // void goBack(String prev) {
  //   prevAddress = prev;
  //   address = prevAddress;
  // }
}

class BrowserState {
  final String content;

  BrowserState(this.content);
}

class History {
  List<BrowserState>? history;

  void push(BrowserState state) {
    history!.add(state);
  }

  BrowserState pop() {
    return history!.removeAt(history!.length - 1);
  }
}
