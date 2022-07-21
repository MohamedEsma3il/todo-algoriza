import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.text,
    required this.function,

  }) : super(key: key);

  double width  = double.infinity;
  Color background = Colors.green;
  Color textColor = Colors.white;
  double radius = 5.0;
  bool isUpperCase = true;
  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
  }
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  double radius = 5.0,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.blue),
        color: background,
      ),
    );
