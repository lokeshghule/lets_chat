import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Color colors;
  String title;
  VoidCallback onPressed;

  RoundedButton(
      {this.colors = Colors.blue,
      this.title = 'Button',
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: colors,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300,
          height: 40,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
