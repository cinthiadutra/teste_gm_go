class CategoriaItem {
  String? nome;
  String? icone;

  CategoriaItem({this.nome, this.icone});

  CategoriaItem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    icone = json['icone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['icone'] = icone;
    return data;
  }
}