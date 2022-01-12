

import 'package:flutter/material.dart';
import 'package:mob_car_2/data/remote/crud_db.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';
import 'package:mob_car_2/presentation/repositories/home_presenter_repository.dart';

class HomePresenter{
  HomePresenterRepository _presenter ;
  late CrudDb _crudDb ;

  HomePresenter(this._presenter){
    _crudDb = CrudDb();
  }



  Future<void> create(PriceEntity data)async{

    bool response = await  _crudDb.createDb(data);
    if(response){
      _presenter.sucessOrErrorCreate("Sucesso!", const Color(0xFF5EFF4C));

    }
    else{
      _presenter.sucessOrErrorCreate("Error!", const Color(0xFFD20108));
    }


  }


  Future<void> delete(String id ) async {
     await _crudDb.deleteDb(id);

    }



  Future<void>update(PriceEntity data)async {

    bool response = await _crudDb.updateDb(data);

    if(response){
      _presenter.sucessOrErrorCreate("Sucesso!", const Color(0xFF5EFF4C));

    }
    else{
      _presenter.sucessOrErrorCreate("Error!", const Color(0xFFD20108));
    }

  }


}