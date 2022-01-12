import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';

Future<void> reserveCarHome(BuildContext context, {required PriceEntity data}) async {
  TextStyle _textStyle = TextStyle(fontSize: 17.0);
  return showDialog<void>(
      context: context,

      // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 14.0, right: 14.0, bottom: 14.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0)),
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Icon(Icons.directions_car),
                          ),
                          const Text(
                            "Title",
                            style: TextStyle(fontSize : 20,fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.close))
                        ],
                      ),
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            height: 130.0,
                            child: Image.network(data.urlImage, fit: BoxFit.fill),
                          )),

                      Padding(
                        padding: const EdgeInsets.only(right: 40,bottom: 30),
                        child: Row(children: [
                          Text(data.model,style:_textStyle),const Spacer(),Text(data.year.toString(),style:_textStyle ,)
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40,bottom: 30),
                        child: Row(children: [
                          Text(data.brand,style:_textStyle),const Spacer(),Text(data.price,style:_textStyle)
                        ],),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){},
                          child: const Text(
                            "Reservar",
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              )),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
