


import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class GetCarDb{


  getAllCars() async {

    var apiResponse = await ParseObject('Cars').getAll();

    if (apiResponse.success){
     print(apiResponse.results);
    }


}


}