// ignore_for_file: file_names

class ServiceResult {
  final String cep;
  final String bairro;
  final String end;

  ServiceResult(
      {required this.cep,
      required this.bairro,
      required this.end,});

  ServiceResult.fromJson(Map<String, dynamic> json,)
      : cep = json['cep'] ?? '',
        bairro = json['bairro'] ?? '',
        end = json['end'] ?? '';
}
