import 'dart:async';

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
    return StreamBuilder<bool>(
      initialData: false,
      stream: notify.stream,
      builder: (context, snapshot) {
        return DropdownButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.arrow_drop_down_sharp),
          ),
          isExpanded: true,
          underline: Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0),),
                border: Border.all(color: Colors.black)
            ),
          ),
          value: oneState,
          hint: Padding(
            padding: const EdgeInsets.only(left :8.0),
            child: Text(hintText),
          ),
          onChanged: (String? newValue) {
            List n = newValue!.split("=");
            oneState = newValue;

            notify.sink.add(true);

            validator(n[0]);
          },
          items : items.map(( location) {
            return DropdownMenuItem<String>(
              value: '${location.code}=${location.code}',
              child: Padding(
                padding: const EdgeInsets.only(left : 18.0),
                child: Text(location.name,overflow: TextOverflow.ellipsis,),
              ),
            );
          }).toList(),
        );
      }
    );
  }
}



