
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  final Size size;
  const DrawerHome({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Button"))
        ],
      ),
    );
  }
}
