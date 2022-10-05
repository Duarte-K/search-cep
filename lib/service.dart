// ignore_for_file: unused_field, prefer_final_fields, prefer_const_declarations, unused_local_variable

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:search_cep/serviceResponse.dart';
import 'package:search_cep/serviceResult.dart';
import 'package:search_cep/soapUtil.dart';

class Service{
  final _dio = Dio();
  int? _statusCode = 0;

  final options = Options(headers: {
    'Content-Type': ' text/xml; charset=utf-8',
  });

  String getMessageDefault({int code = 0}) {
    if (_statusCode == 0) {
      code = _statusCode!;
    }

    return 'Ocorreu um erro, tente novamente - Status ($_statusCode)';
  }

  Service() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  Future doAuth(String cep) async{
    final xml = '''
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">
      <soapenv:Header/>
      <soapenv:Body>
        <cli:consultaCEP>
          <cep>$cep</cep>
        </cli:consultaCEP>
      </soapenv:Body>
    </soapenv:Envelope>
    ''';

    Response response =
      await _dio.post('https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente', options: options, data: xml);

    _statusCode = response.statusCode;

    return ServiceResponse.fromJson(BaseSoapUtil.toJson(response));

  }
}