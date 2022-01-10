


import 'package:mob_car_2/data/remote/http.dart';
import 'package:mob_car_2/data/repositories/get_data_repository.dart';
import 'package:mob_car_2/domain/entities/year_entity.dart';

class GetYearData implements GetDataRepository<List<YearEntity>>{
  late Http _http;
  GetYearData(){
    _http = Http();
  }

  @override
  Future<List<YearEntity>> get(List codes) async{

    var response = await _http.get(endpoint: "/marcas/${codes[0]}/modelos/${codes[1]}/anos");
    if(response.statusCode == 200 ||response.statusCode == 201 ) {
      return response.data.map<YearEntity>((e)=>YearEntity(name: e["nome"],
          code: e["codigo"])).toList();
    }
    else{
      return [];
    }
  }
}