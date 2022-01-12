


import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';

class BlocValidator implements Bloc{

  final StreamController<String> _validatorForModel  = StreamController<String>.broadcast();
  final StreamController<List> _validatorForYear  = StreamController<List>.broadcast();
  final StreamController<String> _validatorForValue  = StreamController<String>.broadcast();
  final StreamController<bool> _validatorButton  = StreamController<bool>.broadcast();

  final StreamController<bool> _homeController  = StreamController<bool>.broadcast();

  Stream<String> get getValidatorForModel => _validatorForModel.stream;
  Stream<List> get getValidatorForYear => _validatorForYear.stream;
  Stream<String> get getValidatorForValue => _validatorForValue.stream;
  Stream<bool> get getvalidatorButton => _validatorButton.stream;


  Stream<bool> get getHomeController => _homeController.stream;

 Sink<String> get setValidatorForModel => _validatorForModel.sink;
 Sink<List> get setValidatorForYear => _validatorForYear.sink;
 Sink<String> get setValidatorForValue => _validatorForValue.sink;
 Sink<bool> get setvalidatorButton => _validatorButton.sink;


  Sink<bool> get setHomeController => _homeController.sink;


  @override
  void dispose() {
   _validatorForModel.close();
   _validatorForYear.close();
   _validatorForValue.close();
   _homeController.close();
   _validatorButton.close();
  }



}