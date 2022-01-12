
import 'package:mob_car_2/data/repositories/db_crud_repository.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CrudDb implements CrudDbRepository{
  late ParseObject _parser;
  
  final String _year = "AnoModelo";
  final String _model = "Modelo";
  final String _brand = "Marca";
  final String _price = "Valor";
  final String _objId =  "objectId";

  CrudDb(){
    _parser = ParseObject("Cars");
  }

  @override
  Future<List<PriceEntity>> readDb() async  {
    ParseResponse response = await _parser.getAll();
    if(response.success){
      return response.results!.map((json) =>
          PriceEntity(price :json[_price],
              brand : json[_brand] ,
              model : json[_model],
              year  : json[_year],
                id  : json[_objId]
          )).toList();

    }
    else{
      return [];
    }
  }




 

  @override
  Future<bool> createDb(PriceEntity data) async {
    _parser
      ..set(_brand,data.model)
    ..set(_model, data.brand)
    ..set(_price, data.price)
    ..set(_year,data.year);
    
    
    ParseResponse response = await _parser.save();
    if(response.success){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Future<bool> deleteDb(String id) async{

    _parser.objectId = id;
    ParseResponse response = await _parser.delete();
    if(response.success){
      return true;
    }
    else{
      return false;
    }

  }

  @override
  Future<bool> updateDb(PriceEntity data) async {
    print(data.id);
    _parser
    ..objectId = data.id
      ..set(_brand,data.model)
      ..set(_model, data.brand)
      ..set(_price, data.price)
      ..set(_year,data.year);


    ParseResponse response = await _parser.save();
    if(response.success){
      return true;
    }
    else{
      return false;
    }

  }



}