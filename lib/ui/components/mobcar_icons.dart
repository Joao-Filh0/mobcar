
import 'package:flutter/material.dart';

Widget steeringIcon =  Column(
  children: const [
    Icon(
      IconData(0xe800, fontFamily: "steeringWheel"),
      color: Colors.blue,
    ),
    Text(
      "mob car",
      style: TextStyle(color: Colors.blue, fontSize: 10.0),
    )
  ],
);

//============================================================


Widget mobCarIconIn = const Icon(
  IconData(0xe800, fontFamily: "mobCarIn"),
  color: Colors.blue,
);