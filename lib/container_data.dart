// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
final String end;
final String bairro;
final String cep;

  const Dados({required this.end, required this.bairro, required this.cep, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(end),
          Text(bairro),
          Text(cep),
        ],
      ),
    );
  }
}