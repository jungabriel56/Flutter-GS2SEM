import 'dart:convert';
import 'package:gs/models/eletroposto.dart';
import 'package:http/http.dart' as http;

class EletropostoService {
  final String apiUrl =
      "https://eletropostos.azurewebsites.net/api/eletroposto";

  Future<List<Eletroposto>> fetchEletropostos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((eletroposto) => Eletroposto.fromJson(eletroposto))
          .toList();
    } else {
      throw Exception('Não foi possível carregar os eletropostos');
    }
  }
}
