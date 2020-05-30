import 'dart:convert';

class linhasModel {
  String situacao;
  String modificado;
  String criado;
  int codigo;
  int id;
  String descricao;
  String cor;

  linhasModel(
      {this.situacao, this.modificado, this.criado, this.codigo, this.id, this.descricao,this.cor});

  linhasModel.fromJson(Map<String, dynamic> json) {
    situacao = json['situacao'];
    modificado = json['modificado'];
    criado = json['criado'];
    codigo = json['codigo'];
    id = json['id'];
    descricao = getDescricao(json['descricao']);
    cor = getCorLinha(codigo);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['situacao'] = this.situacao;
    data['modificado'] = this.modificado;
    data['criado'] = this.criado;
    data['codigo'] = this.codigo;
    data['id'] = this.id;
    data['descricao'] = getDescricao(this.descricao);
    data['cor'] = getCorLinha(codigo);
    return data;
  }

}

String getCorLinha(int codigo){
  String linesColors = '{"1":"Azul","2":"Verde","3":"Vermelha","4":"Amarela",'
      '"5":"Lilás","7":"Rubi","8":"Diamante","9":"Esmeralda","10":"Turquesa",'
      '"11":"Coral","12":"Safira","13":"Jade","15":"Prata"}';
  Map<String, dynamic> linhascores = jsonDecode(linesColors);
  String cor = linhascores["$codigo"];
  return cor;
}

String getDescricao(String descricao){
  String desc = "\nHorário de funcionamento: 04:40h até 00:00h";
      if (descricao != null){
      desc = descricao;
    }
  return desc;
}




