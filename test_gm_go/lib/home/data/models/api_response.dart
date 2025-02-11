import 'package:test_gm_go/home/data/models/data.dart';

class ApiResponse {
  final bool sucesso;
  final Data? data;
  final List<dynamic> mensagem;

  ApiResponse({
    required this.sucesso,
    required this.data,
    required this.mensagem,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      sucesso: json['sucesso'] ?? false,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      mensagem: List<dynamic>.from(json['mensagem'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sucesso': sucesso,
      'data': data?.toJson(),
      'mensagem': mensagem,
    };
  }

  factory ApiResponse.empty() {
    return ApiResponse(
      sucesso: false,
      data: null,
      mensagem: [],
    );
  }
}