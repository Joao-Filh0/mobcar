



import 'package:mob_car_2/domain/entities/price_entity.dart';

extension PriceDto on PriceEntity{

  fromJson()=> PriceEntity(price: price, brand: brand, model: model, year: year);

  toJson()=> {"Valor": price,
    "Marca": brand,
    "Modelo": model,
    "AnoModelo": year,
    };

}