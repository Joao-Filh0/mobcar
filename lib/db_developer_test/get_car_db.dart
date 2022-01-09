


import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class GetCarDb{


  getAllCars() async {
    var dietPlan = ParseObject('Cars')
      ..set('Name', 'Ketogenic')
      ..set('Fat', 65);
    await dietPlan.save();


}


}