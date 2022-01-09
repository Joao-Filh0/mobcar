

import 'package:dio/dio.dart';



class GetCars{
  Dio dio = Dio();
  
  
  
 Future<List<dynamic>> getMarca() async{
    Response response;
    response = await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas');
    return response.data;
  }

  Future<List<dynamic>> getModelo(String code) async{
    Response response;
    response = await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas/$code/modelos'.trim());
    return response.data["modelos"];
  }


  Future<List<dynamic>> getAno(List codes) async{
    Response response;
    response = await dio.get( "https://parallelum.com.br/fipe/api/v1/carros/marcas/${codes[0]}/modelos/${codes[1]}/anos".trim());
    return response.data;
  }
  Future<Map> getValor(List codes) async{
    Response response;
    response = await dio.get("https://parallelum.com.br/fipe/api/v1/carros/marcas/${codes[0]}/modelos/${codes[1]}/anos/${codes[2]}".trim());
    return response.data;
  }
  
}