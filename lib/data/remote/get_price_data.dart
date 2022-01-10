

import 'package:mob_car_2/data/remote/http.dart';
import 'package:mob_car_2/data/repositories/get_data_repository.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';

class GetPriceData implements GetDataRepository<PriceEntity>{
  late Http _http;
  GetPriceData(){
    _http = Http();
  }

  @override
  Future<PriceEntity?>get(List codes) async{
    var response = await _http.get(endpoint: "/marcas/${codes[0]}/modelos/${codes[1]}/anos/${codes[2]}");
    if(response.statusCode == 200 ||response.statusCode == 201 ) {
      return
        PriceEntity(year: response.data["AnoModelo"], price:  response.data['Valor'], model:  response.data['Modelo'],
            brand:  response.data['Marca']);
    }
    else {
      return null;
    }
    }
  }


