import 'package:flutter/material.dart';

import 'menu_item_home.dart';



class TitleInfoHome extends StatelessWidget {
  final VoidCallback view;
  final VoidCallback edit;
  final VoidCallback delete;
  final String title;
  final String url;
  final String year;
  const TitleInfoHome({Key? key,
    required this.title, required this.year,
    required this.view,
    required this.edit, required this.delete,
    required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
        ListTile(
          leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                height: 48,
                width: 60,
                child: Image.network(
                  url,
                  fit : BoxFit.fill
                ),
              )),
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(year),
             const Text('View More',
                  style: TextStyle(color: Color(0xF705D7EA)))
            ],
          ),
          trailing: menuItemHome(context,view: view,
            edit: edit, delete: delete,)
        ),
      ],
    );

  }



}
