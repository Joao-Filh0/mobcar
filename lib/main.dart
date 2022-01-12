import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/presentation/bloc/bloc_validator.dart';
import 'package:mob_car_2/ui/home_page/home_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = '8NZP5YsGRSQYdRwW8eqpmE8PrT1dSbBDliMp9hm3';
  const keyClientKey = 'tNQrxhppfPlvonUTqfLAHJYdlFe8cO9UaA6eV0sX';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: false);

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,

        home: BlocProvider<BlocValidator>(creator: (context,bloc)=>BlocValidator(),
          child:  const HomePage(),
        )));
}


