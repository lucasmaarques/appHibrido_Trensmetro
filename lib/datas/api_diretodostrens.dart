import 'package:trensmetroconsulta/utilities/networkHelper.dart';

class API{

  Future getFutureDados() async =>
      await Future.delayed(Duration(seconds: 1), () async {
        var helper = NetworkHelper(url: "https://www.diretodostrens.com.br/api/status");
        var dados = await helper.getData();
        return dados;
      });
}