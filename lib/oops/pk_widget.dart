abstract class PKWidget implements RenderingEngine {
  String? text;
  void enable() {
    print("Enable");
  }

  void disable() {
    print("Disable");
  }

  @override
  void render();
}

class PKTextBox extends PKWidget {
  void render() {
    print("Rendering");
  }
}

class PKButton extends PKWidget {
  @override
  void render() {
    print("Rendering TextBox");
  }
}

class Animal {
  void walk() {}
  num? noOfLegs;
  void run() {}
}

class Dog extends Animal {}

abstract class RenderingEngine {
  void render();
}
