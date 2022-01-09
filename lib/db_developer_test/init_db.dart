import 'package:parse_server_sdk/parse_server_sdk.dart';
class InitDb{



  Future<void> initServer({required String appId,required String serverUrl,required String clientKey}) async{
    await Parse().initialize(appId, serverUrl, clientKey: clientKey);


  }



}