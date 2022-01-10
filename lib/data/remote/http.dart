




import 'package:dio/dio.dart';
import 'package:mob_car_2/data/repositories/http_repository.dart';

class Http implements HttpRepository<Response>{
  late Dio _dio ;
  late BaseOptions urlOptions;
  Http(){
    urlOptions =  BaseOptions(
      baseUrl: 'https://parallelum.com.br/fipe/api/v1/carros',
    );
    _dio = Dio(urlOptions);


  }


  @override
  Future<Response> get({required String endpoint})async {
    Response response = await _dio.get(endpoint);
    return response;
  }


}