
import 'package:test_gm_go/home/data/models/item.dart';
import 'package:test_gm_go/home/data/models/item_categoria.dart';
import 'package:test_gm_go/home/data/models/periodo.dart';

class Suite {
  String? nome;
  int? qtd;
  bool? exibirQtdDisponiveis;
  List<String>? fotos;
  List<Item>? itens;
  List<CategoriaItem>? categoriaItens;
  List<Periodo>? periodos;

  Suite(
      {this.nome,
      this.qtd,
      this.exibirQtdDisponiveis,
      this.fotos,
      this.itens,
      this.categoriaItens,
      this.periodos});

  Suite.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    qtd = json['qtd'];
    exibirQtdDisponiveis = json['exibirQtdDisponiveis'];
    fotos = json['fotos'].cast<String>();
    if (json['itens'] != null) {
      itens = <Item>[];
      json['itens'].forEach((v) {
        itens!.add(Item.fromJson(v));
      });
    }
    if (json['categoriaItens'] != null) {
      categoriaItens = <CategoriaItem>[];
      json['categoriaItens'].forEach((v) {
        categoriaItens!.add(CategoriaItem.fromJson(v));
      });
    }
    if (json['periodos'] != null) {
      periodos = <Periodo>[];
      json['periodos'].forEach((v) {
        periodos!.add(Periodo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['qtd'] = qtd;
    data['exibirQtdDisponiveis'] = exibirQtdDisponiveis;
    data['fotos'] = fotos;
    if (itens != null) {
      data['itens'] = itens!.map((v) => v.toJson()).toList();
    }
    if (categoriaItens != null) {
      data['categoriaItens'] =
          categoriaItens!.map((v) => v.toJson()).toList();
    }
    if (periodos != null) {
      data['periodos'] = periodos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}