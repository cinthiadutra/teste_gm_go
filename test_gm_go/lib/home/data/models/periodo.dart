import 'package:test_gm_go/home/data/models/desconto.dart';

class Periodo {
  String? tempoFormatado;
  String? tempo;
  double? valor;
  double? valorTotal;
  bool? temCortesia;
  Desconto? desconto;

  Periodo(
      {this.tempoFormatado,
      this.tempo,
      this.valor,
      this.valorTotal,
      this.temCortesia,
      this.desconto});

  Periodo.fromJson(Map<String, dynamic> json) {
    tempoFormatado = json['tempoFormatado'];
    tempo = json['tempo'];
    valor = json['valor'];
    valorTotal = json['valorTotal'];
    temCortesia = json['temCortesia'];
    desconto = json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tempoFormatado'] = tempoFormatado;
    data['tempo'] = tempo;
    data['valor'] = valor;
    data['valorTotal'] = valorTotal;
    data['temCortesia'] = temCortesia;
    if (desconto != null) {
      data['desconto'] = desconto!.toJson();
    }
    return data;
  }
}