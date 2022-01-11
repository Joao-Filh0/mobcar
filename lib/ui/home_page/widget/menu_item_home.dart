import 'package:flutter/material.dart';

Widget menuItemHome(BuildContext context ,{required VoidCallback view,
  required VoidCallback edit,
  required VoidCallback delete
}){

  return PopupMenuButton(
  itemBuilder: (BuildContext context) {
    return [
      PopupMenuItem(
        child: Text("View"),
        onTap: () {
          Future.delayed(Duration(microseconds: 1))
              .then((_) => view());
        },
      ),
      PopupMenuItem(child: Text("Edit"),onTap:(){
        Future.delayed(Duration(microseconds: 1))
            .then((_) => edit());
      },),
      PopupMenuItem(child: Text("Delete"))
    ];
  },
);}