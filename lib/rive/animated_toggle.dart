import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedToggle<T> extends StatelessWidget {
  final List<T> values;
  final List<String> labels;
  final T selectedValue;
  final ValueChanged<T> onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  AnimatedToggle({
    required this.values,
    required this.onToggleCallback,
    required this.labels,
    required this.selectedValue,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: 60,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  onToggleCallback(
                      values[0] != selectedValue ? values[0] : values[1]);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      labels.length,
                      (index) => Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xAA000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                alignment: values[0] == selectedValue
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: constraints.maxWidth / 2,
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                  ),
                  child: Text(
                    values[0] == selectedValue ? labels[0] : labels[1],
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
