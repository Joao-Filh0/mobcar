
import 'package:mob_car_2/data/repositories/get_data_repository.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';

import 'get_price_data.dart';

main()async {
  GetDataRepository getYearData = GetPriceData();

  PriceEntity response = await getYearData.get(["59","5940","2014-3"]);
  print(response.year);





}