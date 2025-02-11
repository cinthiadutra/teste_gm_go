class Desconto {
  double? desconto;

  Desconto({this.desconto});

  Desconto.fromJson(Map<String, dynamic> json) {
    desconto = json['desconto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['desconto'] = desconto;
    return data;
  }
}