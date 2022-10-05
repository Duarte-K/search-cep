// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class BaseSoapUtil {
  static dynamic findField(
      final Map<String, dynamic> json, final String field, String action) {
    final result = json["soap:Envelope"]["soap:Body"][action][field];
    if (result == null) {
      return '';
    }
    return result;
  }

  static Map<String, dynamic> toJson(Response response) {
    final _xmlTojson = Xml2Json();

    _xmlTojson.parse(response.toString());

    return json.decode(_xmlTojson.toParker());
  }

  static String convertSha256(String value) {
    List<int> bytes = utf8.encode(value);
    return sha256.convert(bytes).toString();
  }
}
