// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ClientHttp {
 Future<Map<String, dynamic>> get(String url);
}

class ClientHttpImp extends ClientHttp {
  final http.Client _httpClient;
  ClientHttpImp({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();
  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        return jsonDecode(decodedBody) as Map<String, dynamic>;
      } else {
        throw Exception('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro na requisição GET: $e');
    }
  }

  void dispose() {
    _httpClient.close();
  }}