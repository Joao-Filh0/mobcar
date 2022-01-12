
import 'package:flutter/material.dart';
import 'package:mob_car_2/ui/components/mobcar_icons.dart';

class DrawerHome extends StatelessWidget {
  final Size size;
  const DrawerHome({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: steeringIcon,
              ),


        IconButton(
        icon:   mobCarIconIn,
        onPressed: () => Navigator.of(context).pop(),

      )
            ],
          )

         ,const  Text("Drawer Criado",style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
