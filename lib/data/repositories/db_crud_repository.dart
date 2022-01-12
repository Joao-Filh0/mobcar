


import 'package:mob_car_2/domain/entities/price_entity.dart';

abstract class CrudDbRepository{

  Future<List<PriceEntity>> readDb();
  Future<bool> createDb(PriceEntity data);
  Future<bool> updateDb(PriceEntity data);
  Future<bool> deleteDb(String id);



}