


import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class GetCarDb{


 Future<List<dynamic>> getAllCars() async {
    var reponse = await ParseObject('Cars').getAll();

    return reponse.results!;




}


}