

import 'package:flutter/material.dart';


Widget Button({required String text ,required VoidCallback onPressed,
Color? border, required Color backGroundColor, Color? colorText}){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: colorText ?? Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: backGroundColor,
        side: BorderSide( color: border ?? backGroundColor),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ),),
  );
}