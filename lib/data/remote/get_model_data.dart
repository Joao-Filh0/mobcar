
import 'package:mob_car_2/data/remote/http.dart';
import 'package:mob_car_2/data/repositories/get_data_repository.dart';
import 'package:mob_car_2/domain/entities/model_entity.dart';

class GetModelData implements GetDataRepository<List<ModelEntity>>{
  late Http _http;
  GetModelData(){
    _http = Http();
  }
  @override
  Future<List<ModelEntity>> get(List codes) async  {
    var response = await _http.get(endpoint: "/marcas/${codes[0]}/modelos");
    if(response.statusCode == 200 ||response.statusCode == 201 ) {
      return response.data["modelos"].map<ModelEntity>((e)=>ModelEntity(name: e["nome"],
          code: e["codigo"].toString())).toList();
    }
    else{
      return [];
    }

  }



}