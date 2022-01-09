import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/db_developer_test/init_db.dart';
import 'package:mob_car_2/ui/home_page/bloc/bloc_validator.dart';
import 'package:mob_car_2/ui/home_page/home_page.dart';

void main() async {
  InitDb initDb = InitDb();
  WidgetsFlutterBinding.ensureInitialized();
  initDb.initServer(appId: 'NV5VwRq7VLrJ2dqicaFoMc2BBohj7QbcpjYNCZDO',
      clientKey: 'LbWYQNdQPxFGHYI9VdLzmYMBtGoxPL9rORYcazoz',
      serverUrl: 'https://parseapi.back4app.com');
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,

        home: BlocProvider<BlocValidator>(creator: (context,bloc)=>BlocValidator(),
          child:  const HomePage(),
        )));
}


