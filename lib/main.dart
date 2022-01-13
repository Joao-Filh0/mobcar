import 'package:bloc_provider/bloc_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/presentation/bloc/bloc_validator.dart';
import 'package:mob_car_2/ui/home_page/home_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'uZlGCvuSExb3UxTIJywIRcmtHYJBNfIP2KgLS9eH';
  const keyClientKey = '4co4uWGO7I3PB5AhL3A2Rh44mG1RN7N6KTyRvM0E';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: false);

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,

        home: BlocProvider<BlocValidator>(creator: (context,bloc)=>BlocValidator(),
          child:  DevicePreview(
            enabled: false,//
            builder: (context)=>const HomePage(),),
        )));
}


