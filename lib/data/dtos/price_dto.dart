



import 'package:mob_car_2/domain/entities/price_entity.dart';

extension PriceDto on PriceEntity{
  toJson()=> {"Valor": price,
    "Marca": brand,
    "Modelo": model,
    "AnoModelo": year,
    };

}