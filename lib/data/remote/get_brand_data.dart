

import 'package:mob_car_2/data/remote/http.dart';
import 'package:mob_car_2/data/repositories/get_brand_data_repository.dart';
import 'package:mob_car_2/domain/entities/brand_entity.dart';

class GetBrandData implements GetBrandDataRepository<List<BrandEntity>>{
  late Http _http;
  GetBrandData(){
    _http = Http();
  }

  @override
  Future<List<BrandEntity>> get() async{

    var response = await _http.get(endpoint: "/marcas");
    if(response.statusCode == 200 ||response.statusCode == 201 ) {
      return response.data.map<BrandEntity>((e)=>BrandEntity(name: e["nome"],
          code: e["codigo"])).toList();
    }
    else{
      return [];
    }
  }
  
  
}