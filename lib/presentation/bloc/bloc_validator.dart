


import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';

class BlocValidator implements Bloc{

  final StreamController<String> _validatorForModel  = StreamController<String>.broadcast();
  final StreamController<List> _validatorForYear  = StreamController<List>.broadcast();
  final StreamController<String> _validatorForValue  = StreamController<String>.broadcast();

  Stream<String> get getValidatorForModel => _validatorForModel.stream;
  Stream<List> get getValidatorForYear => _validatorForYear.stream;
  Stream<String> get getValidatorForValue => _validatorForValue.stream;

 Sink<String> get setValidatorForModel => _validatorForModel.sink;
 Sink<List> get setValidatorForYear => _validatorForYear.sink;
 Sink<String> get setValidatorForValue => _validatorForValue.sink;


  @override
  void dispose() {
   _validatorForModel.close();
   _validatorForYear.close();
   _validatorForValue.close();
  }



}