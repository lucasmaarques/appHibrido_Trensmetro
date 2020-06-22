import 'package:flutter/material.dart';
import 'package:trensmetroconsulta/datas/api_diretodostrens.dart';
import 'package:trensmetroconsulta/models/linhasModel.dart';
import 'package:trensmetroconsulta/screens/telaLinha.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class telaLinhas extends StatefulWidget {
  @override
  _telaLinhasState createState() => _telaLinhasState();
}

class _telaLinhasState extends State<telaLinhas> {
  Future dados;
  @override
  void initState() {
    super.initState();
    dados = API().getFutureDados();
  }

  //RefreshController _refreshController =
  //RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return _constroitelaLinhas();
  }

  Widget _constroitelaLinhas() {
    return Scaffold(
      body: _constroiBodyLinhas(),
//      SmartRefresher(
//      enablePullDown: true,
//        enablePullUp: true,
//        controller: _refreshController,
//        onRefresh: _onRefresh,
//        onLoading: _onLoading,
//        child: _constroiBodyLinhas(),
//        physics: BouncingScrollPhysics(),
//        footer: ClassicFooter(
//          loadStyle: LoadStyle.ShowWhenLoading,
//          completeDuration: Duration(milliseconds: 500),
//        ),
//      ),
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
            setState(() {
              dados = API().getFutureDados();
            });

          },
        )
      ],
    );
  }

  _constroiBodyLinhas() {
    return FutureBuilder(
      future: dados,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> linhas = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              linhasModel linha = linhasModel.fromJson(linhas[index]);
              return _construirLinhaLinhas(linha);
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

  _construirLinhaLinhas(linhasModel linha) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => telaLinha(linha)
              ));
        },
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
//              Expanded(child: Center(child: Text( linha.modificado,
//                style: TextStyle(fontSize: 18),))),
              Expanded(child: Center(child: Text("Linha " + linha.codigo.toString(),
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))),
              Expanded(child: Center(child: Text(linha.cor.toUpperCase(),
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
              Expanded(child: Center(
                  child: Text(linha.situacao.replaceAll("Operação", "").toUpperCase(), style: TextStyle(fontSize: 17.5),)))
            ],
          ),
        )
    );
  }


//  void _onRefresh() async{
//    // monitor network fetch
//    await Future.delayed(Duration(milliseconds: 1000));
//    // if failed,use refreshFailed()
//    _refreshController.refreshCompleted();
//  }
//
//  void _onLoading() async{
//    // monitor network fetch
//    await Future.delayed(Duration(milliseconds: 1000));
//    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    setState(() {
//      dados = API().getFutureDados();
//    });
//    if(mounted)
//      setState(() {
//
//      });
//    _refreshController.loadComplete();
//  }
}