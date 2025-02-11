import 'package:test_gm_go/home/data/models/motel.dart';

class Data {
  int? pagina;
  int? qtdPorPagina;
  int? totalSuites;
  int? totalMoteis;
  int? raio;
  double? maxPaginas;
  List<Motel>? moteis;

  Data(
      {this.pagina,
      this.qtdPorPagina,
      this.totalSuites,
      this.totalMoteis,
      this.raio,
      this.maxPaginas,
      this.moteis});

  Data.fromJson(Map<String, dynamic> json) {
    pagina = json['pagina'];
    qtdPorPagina = json['qtdPorPagina'];
    totalSuites = json['totalSuites'];
    totalMoteis = json['totalMoteis'];
    raio = json['raio'];
    maxPaginas = json['maxPaginas'];
    if (json['moteis'] != null) {
      moteis = <Motel>[];
      json['moteis'].forEach((v) {
        moteis!.add(Motel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pagina'] = pagina;
    data['qtdPorPagina'] = qtdPorPagina;
    data['totalSuites'] = totalSuites;
    data['totalMoteis'] = totalMoteis;
    data['raio'] = raio;
    data['maxPaginas'] = maxPaginas;
    if (moteis != null) {
      data['moteis'] = moteis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}