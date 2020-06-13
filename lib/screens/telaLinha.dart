import 'package:flutter/material.dart';
import 'package:trensmetroconsulta/datas/api_diretodostrens.dart';
import 'package:trensmetroconsulta/models/linhasModel.dart';


class telaLinha extends StatefulWidget {
  linhasModel linha;
  telaLinha(linhasModel linha){
    this.linha = linha;
  }

  @override
  _telaLinhaState createState() => _telaLinhaState();
}

class _telaLinhaState extends State<telaLinha> {

  @override
  Widget build(BuildContext context) {
    return _constroitelaLinha();
  }

  Widget _constroitelaLinha() {
    return Scaffold(
      body: _constroiBodyLinha(),
      appBar: _constroiAppBarLinha(),
    );
  }

  _constroiAppBarLinha() {
    return AppBar(
      title: Text("Situação da linha " + "${widget.linha.codigo}" + " - ${widget.linha.cor}" , style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
    );
  }

  _constroiBodyLinha() {
//    return FutureBuilder(
//      future: API().getFutureDados(),
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          List<dynamic> linhas = snapshot.data;
//          return ListView.builder(
//            itemBuilder: (context, index) {
//              linhasModel linha = linhasModel.fromJson(linhas[index]);
//              return _construirLinhaLinha(widget.linhas);
//            },
//            itemCount: linhas == null ? 0 : linhas.length,
//          );
//        } else {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//      },
//    );
    return _construirLinhaLinha(widget.linha);
  }

  _construirLinhaLinha(linhasModel linha) {
//        if(linha.codigo == 15){
          String title = "Linha " + linha.codigo.toString() + " - " +linha.cor;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
//            height: 300,
            children: <Widget>[
              Center(child: Text(title,
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
              Center(
                    child: Text(linha.situacao, style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: linha.situacao != "Operação Normal" ? Colors.red : Colors.green),)),
              Center(
                    child: Text(linha.descricao.replaceAll(title, "").toLowerCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: 20,),))
//    child: Text(linha.descricao == null ? "Funcionando normalmente": linha.descricao , style: TextStyle(fontSize: 20,),)) //textAlign: Center
            ],
//            child: Row(
//              children: <Widget>[
//                Expanded(child: Center(child: Text("Linha " + linha.codigo.toString(),
//                  style: TextStyle(fontSize: 18),))),
//                Expanded(child: Center(
//                    child: Text(linha.situacao, style: TextStyle(fontSize: 18),))),
//                Expanded(child: Center(
//                    child: Text(linha.descricao == null ? "" : linha.descricao, style: TextStyle(fontSize: 18),)))
//              ],
//            ),
          );
//        }else{
//          return Container();
//        }

  }
}