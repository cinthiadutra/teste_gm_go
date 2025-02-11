import 'package:test_gm_go/home/data/models/suite.dart';

class Motel {
  String? fantasia;
  String? logo;
  String? bairro;
  double? distancia;
  int? qtdFavoritos;
  List<Suite>? suites;
  int? qtdAvaliacoes;
  double? media;

  Motel(
      {this.fantasia,
      this.logo,
      this.bairro,
      this.distancia,
      this.qtdFavoritos,
      this.suites,
      this.qtdAvaliacoes,
      this.media});

  Motel.fromJson(Map<String, dynamic> json) {
    fantasia = json['fantasia'];
    logo = json['logo'];
    bairro = json['bairro'];
    distancia = json['distancia'];
    qtdFavoritos = json['qtdFavoritos'];
    if (json['suites'] != null) {
      suites = <Suite>[];
      json['suites'].forEach((v) {
        suites!.add(Suite.fromJson(v));
      });
    }
    qtdAvaliacoes = json['qtdAvaliacoes'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fantasia'] = fantasia;
    data['logo'] = logo;
    data['bairro'] = bairro;
    data['distancia'] = distancia;
    data['qtdFavoritos'] = qtdFavoritos;
    if (suites != null) {
      data['suites'] = suites!.map((v) => v.toJson()).toList();
    }
    data['qtdAvaliacoes'] = qtdAvaliacoes;
    data['media'] = media;
    return data;
  }
}