// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:search_cep/container_data.dart';
import 'package:search_cep/form_input.dart';
import 'package:search_cep/service.dart';
import 'package:search_cep/serviceResponse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  late ServiceResponse serviceResponse;
  bool result = false;
  final Service _service = Service();
  TextEditingController cepField = TextEditingController();

  

  request(final String cep) async{
    try {
        serviceResponse = await _service.doAuth(cep);
        if(serviceResponse.serviceResult.cep != null){
          return true;
        }
      } catch (e) {
        rethrow;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta teu CEP aí"),
      ),
     body: Column(
       children: [
        Container(
           width: MediaQuery.of(context).size.width,  
            child: FormInput(
              controller: cepField,
              hintText: '60337380',
            )
         ),
         if(isVisible)
          Dados(
            cep: serviceResponse.serviceResult.cep,
            bairro: serviceResponse.serviceResult.bairro,
            end: serviceResponse.serviceResult.end,
          ),
          TextButton(
            onPressed: () async{
              isVisible = false;
              result = await request(cepField.text);
              
              if(result){
                setState(() {
                  isVisible = !isVisible; 
                });
              }
            }, 
            child: Text("Consultar")
          )
       ],
     ),
    );
  }
}