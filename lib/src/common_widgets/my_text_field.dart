import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'Digite o texto',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          alignLabelWithHint: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
      ),
    );
  }
}