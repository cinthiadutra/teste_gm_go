class Item {
  String? nome;

  Item({this.nome});

  Item.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    return data;
  }
}