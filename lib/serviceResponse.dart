

import 'package:search_cep/serviceResult.dart';
import 'package:search_cep/soapUtil.dart';

class ServiceResponse {
  final ServiceResult serviceResult;

  ServiceResponse({
    required this.serviceResult,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {

    var result = ServiceResult.fromJson(
      BaseSoapUtil.findField(
        json, 'return', "ns2:consultaCEPResponse")
    );
    return ServiceResponse(serviceResult: result);
  }
}