import 'dart:async';
import 'package:flutter/material.dart';

Future<void> reserveCarHome(BuildContext context, {required String url}) async {
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
                    borderRadius: BorderRadius.circular(12)),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.close))
                        ],
                      ),
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            height: 130.0,
                            child: Image.network(
                                "https://cdn.motor1.com/images/mgl/VobQz/s1/10-carros-brasileiros-com-nomes-curiosos-no-exterior.jpg",
                                fit: BoxFit.fill),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
