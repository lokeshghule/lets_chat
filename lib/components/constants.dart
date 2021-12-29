import 'package:flutter/material.dart';

const kInputTextFieldDecoration = InputDecoration(
  fillColor: Color(0xFFE1F5FE),
  filled: true,
  hintText: 'Enter a value',
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);
