import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';



class CustomdropDownMenuItem extends StatelessWidget {

  final String hintText;
  final List<dynamic> items;
  final  Function(String) validator ;
   CustomdropDownMenuItem( this.hintText,this.items,
   this.validator,{Key? key}) : super(key: key);




  StreamController<bool> notify = StreamController<bool>.broadcast();
  String? oneState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0),),
            border: Border.all(color: Colors.black)
        ),
        child: StreamBuilder<bool>(
          initialData: false,
          stream: notify.stream,
          builder: (context, snapshot) {
            return DropdownButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.arrow_drop_down_sharp),
              ),
              isExpanded: true,
              underline: Container(),
              value: oneState,
              hint: Padding(
                padding: const EdgeInsets.only(left :8.0),
                child: Text(hintText),
              ),
              onChanged: (String? newValue) {
                oneState = newValue;

                notify.sink.add(true);

                validator(newValue!);
              },
              items : items.map(( location) {
                return DropdownMenuItem<String>(
                  value: location["codigo"].toString(),
                  child: Padding(
                    padding: const EdgeInsets.only(left : 18.0),
                    child: Text(location["nome"]),
                  ),
                );
              }).toList(),
            );
          }
        ),
      ),
    );
  }
}



