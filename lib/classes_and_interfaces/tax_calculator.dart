abstract class TaxCalculate {
  void calculate();
}

class TextCalculator2021 implements TaxCalculate {
  @override
  void calculate() {
    print("1L hua 20%");
  }
}
