import 'package:flutter_test/flutter_test.dart';
import 'package:search_cep/service.dart';

void main() {
  Service service = Service();
  test('Bla bla bla', () async {
    await service.doAuth('60331240');
  }); 
}