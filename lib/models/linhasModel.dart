class linhasModel {
  String situacao;
  String modificado;
  String criado;
  int codigo;
  int id;
  String descricao;

  linhasModel(
      {this.situacao, this.modificado, this.criado, this.codigo, this.id, this.descricao});

  linhasModel.fromJson(Map<String, dynamic> json) {
    situacao = json['situacao'];
    modificado = json['modificado'];
    criado = json['criado'];
    codigo = json['codigo'];
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['situacao'] = this.situacao;
    data['modificado'] = this.modificado;
    data['criado'] = this.criado;
    data['codigo'] = this.codigo;
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }
}
