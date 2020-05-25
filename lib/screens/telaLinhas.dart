import 'package:flutter/material.dart';
import 'package:trensmetroconsulta/datas/api_diretodostrens.dart';
import 'package:trensmetroconsulta/models/linhasModel.dart';
import 'package:trensmetroconsulta/screens/telaLinha.dart';

class telaLinhas extends StatefulWidget {
  @override
  _telaLinhasState createState() => _telaLinhasState();
}

class _telaLinhasState extends State<telaLinhas> {
  @override
  Widget build(BuildContext context) {
    return _constroitelaLinhas();
  }

  Widget _constroitelaLinhas() {
    return Scaffold(
      body: _constroiBodyLinhas(),
      appBar: _constroiAppBarLinhas(),
    );
  }

  _constroiAppBarLinhas() {
    return AppBar(
      title: Text("Situação das linhas", style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (){
            return Scaffold(
              body: _constroiBodyLinhas(),
            );
          },
        )
      ],
    );
  }

  _constroiBodyLinhas() {
    return FutureBuilder(
      future: API().getFutureDados(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> linhas = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              linhasModel linha = linhasModel.fromJson(linhas[index]);
              return _construirLinhaLinhas(linha.modificado,linha.codigo, linha.situacao);
            },
            itemCount: linhas == null ? 0 : linhas.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _construirLinhaLinhas(String modificado, int codigo, String situacao) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => telaLinha(codigo)
              ));
        },
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
//              Expanded(child: Center(child: Text( modificado,
//                style: TextStyle(fontSize: 18),))),
              Expanded(child: Center(child: Text("Linha " + codigo.toString(),
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
              Expanded(child: Center(
                  child: Text(situacao, style: TextStyle(fontSize: 18),)))
            ],
          ),
        )
    );
  }
}