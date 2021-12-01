import 'package:examen_final_app/bloc/entidades/gama.dart';
import 'package:examen_final_app/bloc/entidades/producto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class gamasData {
  Future<dynamic> gamas() async {
    Uri url = Uri.https('lockappard.azurewebsites.net/api/gama', '');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    }
  }
}
