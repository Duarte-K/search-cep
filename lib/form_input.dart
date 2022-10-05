import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const FormInput({
    Key? key,
    required this.hintText,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: const Color.fromRGBO(204, 204, 204, 1),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.lightBlue,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(179, 179, 179, 1),
              fontSize: 12,
            ),
            border: InputBorder.none,
          ),
        ));
  }
}